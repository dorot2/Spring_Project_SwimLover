package com.swimlover.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.swimlover.domain.CartVOList;
import com.swimlover.domain.MemberVO;
import com.swimlover.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/order/*")
@Controller
public class OrderController {

	@Setter(onMethod_= {@Autowired})
	private OrderService orderService;
	
	@GetMapping("/orderListInfo")
	public void orderListInfo(HttpSession session, Model model) {
		
		String mem_id = ((MemberVO)session.getAttribute("loginStatus")).getMem_id();
			
		List<CartVOList> orderList = orderService.cart_list(mem_id);
		
		model.addAttribute("orderList", orderList);
	}
}
