package com.swimlover.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swimlover.util.FileUtils;
import com.swimlover.domain.CartVOList;
import com.swimlover.domain.MemberVO;
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
	
	// 1) 바로 주문
	@GetMapping("/orderListInfo")
	public void orderListInfo(HttpSession session, Model model) {
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
			
		List<CartVOList> orderList = orderService.cart_list(mem_id);
		
		model.addAttribute("orderList", orderList);
	}
	
	// 카카오페이 결제
	@GetMapping("/orderPay")
	public @ResponseBody ReadyResponse payReady(OrderVO o_vo, PaymentVO p_vo, int totalamount, HttpSession session, Model model) {
		
		log.info("주문정보 : " + o_vo);
		log.info("결제정보 : " + p_vo);
		log.info("총주문금액 : " + totalamount);
		
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
		
		// 장바구니 내역불러오기.
		List<CartVOList> cartList = cartService.cart_list(mem_id);
		
		// 어떤 상품 외 몇 개
		String itemName = cartList.get(0).getPdt_num() + "외" + String.valueOf(cartList.size() - 1) + " 개";
		int quantity = cartList.size() - 1;
		
		// 카카오페이 서버에 1차 준비요청
		ReadyResponse readyResponse = kakaoPayServiceImpl.payReady(itemName, quantity, mem_id, totalamount);
		
		log.info("결제고유번호 : " + readyResponse.getTid());
		log.info("결제요청 URL : " + readyResponse.getNext_redirect_pc_url());

		return readyResponse;
	}
	
	// 결제승인요청
	@GetMapping("/orderApproval")
	public String orderApproval(@RequestParam("pg_token") String pgToken, HttpSession session) {
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
		String tid = (String) session.getAttribute("tid");
		
		ApproveResponse approveResponse = kakaoPayServiceImpl.payApprove(tid, pgToken, mem_id);
		
		OrderVO o_vo = (OrderVO) session.getAttribute("orderVO");
		PaymentVO p_vo = (PaymentVO) session.getAttribute("paymentVO");
		
		// 세션으로 저장한 정보는 사용 후 즉시 소멸
		session.removeAttribute("tid");
		session.removeAttribute("orderVO");
		session.removeAttribute("paymentVO");
		
		orderService.orderSave(o_vo, p_vo);
		
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
