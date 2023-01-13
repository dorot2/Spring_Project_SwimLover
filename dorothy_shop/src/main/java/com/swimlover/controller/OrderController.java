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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swimlover.util.FileUtils;
import com.swimlover.domain.OrderDetailProductVO;
import com.swimlover.dto.Criteria;
import com.swimlover.dto.PageDTO;
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
			
			
		}else if (type.equals("cart")) { //장바구니
			orderList = orderService.cart_list(mem_id);
		}
		
		orderList.forEach(vo -> {
			vo.setPdt_img_folder(vo.getPdt_img_folder().replace("\\", "/"));
		});
		
		// 주문내역
		model.addAttribute("orderList", orderList);
	}
	
	// 클라이언트에서 카카오페이 결제버튼 클릭하면
	@GetMapping(value = "/orderPay", produces = "application/json")
	public @ResponseBody ReadyResponse payReady(String type, OrderVO o_vo, OrderDetailVO od_vo, PaymentVO p_vo, int totalamount, HttpSession session, Model model) {
		
		log.info("주문정보 : " + o_vo);
		log.info("결제정보 : " + p_vo);
		log.info("총주문금액 : " + totalamount);
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
		
		
		//장바구니 내역불러오기. 바로구매에서는 장바구니를 사용하지 않는다.
		List<CartVOList> cartList = cartService.cart_list(mem_id);
		
		
		// 카카오페이 결제 상품명
		String itemName = "";
		int quantity = 0;
		
		
		//주문번호가 시퀀스 작업(중요)
		o_vo.setOdr_code(orderService.getOrderSequence());
		
		o_vo.setMem_id(mem_id);
		p_vo.setMem_id(mem_id);
		
		// 오라클에서는 "" -> Null 처리 됨.
		p_vo.setPay_nobank_user("");
		p_vo.setPay_nobank("");
		
		
		od_vo.setOdr_code(o_vo.getOdr_code());
		
		//주문정보 저장하기.
		if(type.equals("cart")) {
			orderService.orderSave(o_vo, p_vo);  // 주문상세정보를 장바구니를 참조하여, 확보
		}else if(type.equals("direct")) {
			orderService.orderDirectSave(o_vo, od_vo, p_vo);
		}
		
	
		if(type.equals("cart")) {
			
			for(int i=0; i<cartList.size(); i++) {
				itemName += cartList.get(i).getPdt_name() + ",";
			}
			
			itemName = itemName.substring(0, itemName.lastIndexOf(",")-1);
			quantity = cartList.size();
			
		}else if(type.equals("direct")) {
			itemName = "개별상품";
			quantity = 1;
		}
		
	
		//카카오페이 서버에 1차 준비요청
		ReadyResponse  readyResponse = kakaoPayServiceImpl.payReady(o_vo.getOdr_code(), itemName, quantity, mem_id, totalamount);
		
		
		log.info("결제고유번호: " + readyResponse.getTid());
		log.info("결제요청 URL: " + readyResponse.getNext_redirect_pc_url()); // 카카오 페이 API서버에서 보내오는 url
		
		
		session.setAttribute("tid", readyResponse.getTid());
		session.setAttribute("odr_code", o_vo.getOdr_code()); // 주문번호
		
		return readyResponse;
	}
	
	// 결제승인요청
	@GetMapping("/orderApproval")
	public String orderApproval(@RequestParam("pg_token") String pgToken, HttpSession session) {
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
		String tid = (String) session.getAttribute("tid");
		Long odr_code = (Long) session.getAttribute("odr_code");
		
		ApproveResponse approveResponse = kakaoPayServiceImpl.payApprove(odr_code, tid, pgToken, mem_id);
		
 
		//세션으로 저장한 정보는 사용후 즉시 소멸시킨다.
		session.removeAttribute("tid");
		session.removeAttribute("odr_code");
		
		return "redirect:/order/orderComplete";
	}
	
	// 무통장 결제. 
	@PostMapping("/orderSave")
	public String orderSave(String type, OrderVO o_vo, OrderDetailVO od_vo, PaymentVO p_vo, HttpSession session, Model model) {
		
		p_vo.setPay_tot_price(p_vo.getPay_nobank_price());
		
		log.info("주문정보 : " + o_vo);
		log.info("주문상세정보: " + od_vo);
		log.info("결제정보: " + p_vo);
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
		
		//주문번호가 시퀀스 작업(중요)
		o_vo.setOdr_code(orderService.getOrderSequence());
		
		o_vo.setMem_id(mem_id);
		p_vo.setMem_id(mem_id);
		od_vo.setOdr_code(o_vo.getOdr_code());
		
		//주문정보 저장하기.
		if(type.equals("cart")) {
			orderService.orderSave(o_vo, p_vo);  // 주문상세정보를 장바구니를 통하여, 데이타 작업
		}else if(type.equals("direct")) {
			orderService.orderDirectSave(o_vo, od_vo, p_vo);	// 주문작성하기 페이지에서 바로구매 상품정보 데이타 작업
		}
		
		
		return "redirect:/order/orderComplete"; 
	}
	
	// 클라이언트에 보여줄 결제 및 주문 완료
	@GetMapping("/orderComplete")
	public void orderComplete() {
		
	}
	
	@GetMapping("/orderCancel")
	public void orderCancel() {
		
	}
	
	@GetMapping("/orderFail")
	public void orderFail() {
		
	}
	
	// 주문내역
	@GetMapping("/orderList")
	public void orderList(HttpSession session, @ModelAttribute("cri") Criteria cri, Model model) {
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		// 주문목록
		List<OrderVO> orderList = orderService.getOrderList(mem_id, cri);
		model.addAttribute("orderList", orderList);
		
		// 페이징정보
		int totalCount = orderService.getOrderTotalCount(mem_id);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	
	// 주문상세
	@GetMapping("/orderDetail")
	public void orderDetail2(Long odr_code, Model model) {
		List<OrderDetailProductVO> odList = orderService.getOrderDetailList(odr_code);
		
		odList.forEach(vo -> {
			vo.getProductVO().setPdt_img_folder(vo.getProductVO().getPdt_img_folder().replace("\\", "/"));
		});
		
		//주문상세정보. OrderDetailVO
		model.addAttribute("odList", odList);
	}

	
	//상품목록에서 이미지 보여주기.
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {
		
		// C:\\doccomsa\\upload\\goods\\2022\\11\\22\\
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
}
