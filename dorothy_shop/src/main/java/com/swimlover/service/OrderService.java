package com.swimlover.service;

import java.util.List;

import com.swimlover.domain.CartVO;
import com.swimlover.domain.CartVOList;
import com.swimlover.domain.OrderDetailVO;
import com.swimlover.domain.OrderVO;
import com.swimlover.domain.PaymentVO;

public interface OrderService {

	List<CartVOList> cart_list(String mem_id);
	
	// 장바구니 -> 주문
	void orderSave(OrderVO o_vo, PaymentVO p_vo);
	
	// 바로구매 -> 주문
	void orderDirectSave(OrderVO o_vo, OrderDetailVO od_vo, PaymentVO p_vo);
	
	CartVOList directOrder(CartVO vo);
	
	long getOrderSequence();
}
