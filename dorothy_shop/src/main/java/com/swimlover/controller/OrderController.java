package com.swimlover.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swimlover.util.FileUtils;
import com.swimlover.domain.CartVO;
import com.swimlover.domain.CartVOList;
import com.swimlover.domain.MemberVO;
import com.swimlover.domain.OrderDetailVO;
import com.swimlover.domain.OrderVO;
import com.swimlover.domain.PaymentVO;
import com.swimlover.kakaopay.ApproveResponse;
import com.swimlover.kakaopay.ReadyResponse;
import com.swimlover.service.CartService;
import com.swimlover.service.KakaoPayServiceImpl;
import com.swimlover.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/order/*")
@Controller
public class OrderController {

	@Setter(onMethod_= {@Autowired})
	private OrderService orderService;
	
	@Setter(onMethod_= {@Autowired})
	private CartService cartService;
	
	@Setter(onMethod_= {@Autowired})
	private KakaoPayServiceImpl kakaoPayServiceImpl;
	
	// 업로드 폴더 주입
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 1) 바로 주문 -> 주문작성하기    2) 장바구니 -> 주문작성하기
	@GetMapping("/orderListInfo")
	public void orderListInfo(@ModelAttribute("type") String type, @RequestParam(value = "pdt_num", required = false)Integer pdt_num, 
						@RequestParam(value = "odr_amount", required = false) Integer odr_amount, HttpSession session, Model model) {
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
			
		List<CartVOList> orderList = null;
		
		if(type.equals("direct")) { // 바로주문
		
			CartVO cartVO = new CartVO(null, pdt_num, mem_id, odr_amount);
			
			CartVOList cartVOList = orderService.directOrder(cartVO);
			
			orderList = new ArrayList<>();
			orderList.add(cartVOList);
			
			
		}else if (type.contentEquals("cart")) { //장바구니
			orderList = orderService.cart_list(mem_id);
			
			orderList.forEach(vo -> {
				vo.setPdt_img_folder(vo.getPdt_img_folder().replace("\\", "/"));
			});
		}
		
		// 주문내역
		model.addAttribute("orderList", orderList);
	}
	
	// 클라이언트에서 카카오페이 결제버튼 클릭하면
	@GetMapping(value = "/orderPay", produces = "application/json")
	public @ResponseBody ReadyResponse payReady(String type, OrderVO o_vo, OrderDetailVO od_vo, PaymentVO p_vo, int totalamount, HttpSession session, Model model) {
		
		log.info("주문정보 : " + o_vo);
		log.info("결제정보 : " + p_vo);
		log.info("총주문금액 : " + totalamount);
		
		// 주문번호가 시퀀스
		o_vo.setOdr_code(orderService.getOrderSequence());
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
		
		// 장바구니 내역불러오기.
		List<CartVOList> cartList = cartService.cart_list(mem_id);
		
		// 카카오페이 결제 상품명
		String itemName = "";
		int quantity = 0;
		
		if(type.equals("cart")) {
			
			for(int i = 0; i < cartList.size(); i++) {
				itemName += cartList.get(i).getPdt_name() + ",";
			}
			
			itemName = itemName.substring(0, itemName.lastIndexOf(",")-1);
			quantity = cartList.size();
		}else if(type.equals("direct")) {
			itemName = "개별상품";
			quantity = 1;
		}
	
		
		// 카카오페이 서버에 1차 준비요청
		ReadyResponse readyResponse = kakaoPayServiceImpl.payReady(o_vo.getOdr_code(), itemName, quantity, mem_id, totalamount);
		
		log.info("결제고유번호 : " + readyResponse.getTid());
		log.info("결제요청 URL : " + readyResponse.getNext_redirect_pc_url());

		session.setAttribute("tid", readyResponse.getTid());
		
		o_vo.setMem_id(mem_id); //추가
		session.setAttribute("orderVO", o_vo);
		
		session.setAttribute("orderDetailVO", od_vo);
		
		p_vo.setMem_id(mem_id);
		session.setAttribute("paymentVO", p_vo);
		
		//바로구매 또는 장바구니를 통한 구매
		session.setAttribute("type", type);
		
		
		return readyResponse;
	}
	
	// 결제승인요청
	@GetMapping("/orderApproval")
	public String orderApproval(@RequestParam("pg_token") String pgToken, HttpSession session) {
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
		String tid = (String) session.getAttribute("tid");
		OrderVO o_vo = (OrderVO) session.getAttribute("orderVO");
		OrderDetailVO od_vo = (OrderDetailVO) session.getAttribute("OrderDetailVO");
		PaymentVO p_vo = (PaymentVO) session.getAttribute("paymentVO");
		String type = (String) session.getAttribute("type");
		
		ApproveResponse approveResponse = kakaoPayServiceImpl.payApprove(o_vo.getOdr_code(), tid, pgToken, mem_id);
		
 
		//세션으로 저장한 정보는 사용후 즉시 소멸시킨다.
		session.removeAttribute("tid");
		session.removeAttribute("orderVO");
		session.removeAttribute("paymentVO");
		session.removeAttribute("type");
		
		//1)주문테이블 삽입, 2)주문상세테이블 삽입, 3)결제테이블 삽입, 4)장바구니 삭제
		if(type.contentEquals("cart")) {
			orderService.orderSave(o_vo, p_vo); // 주문상세정보를 장바구니를 참조하여, 확보
		}else if (type.equals("direct")) {
			orderService.orderDirectSave(o_vo, null, p_vo); // OrderDetailVO 준비할것.
		}
		
		return "redirect:/order/orderComplete";
	}
	
	@GetMapping("/orderComplete")
	public void orderComplete() {
		
	}
	
	@GetMapping("/orderCancel")
	public void orderCancel() {
		
	}
	
	@GetMapping("/orderFail")
	public void orderFail() {
		
	}

	
	//상품목록에서 이미지 보여주기.
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {
		
		// C:\\doccomsa\\upload\\goods\\2022\\11\\22\\
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
}
