package com.swimlover.service;

import java.util.List;

import com.swimlover.domain.CartVOList;
import com.swimlover.domain.OrderVO;
import com.swimlover.domain.PaymentVO;

public interface OrderService {

	List<CartVOList> cart_list(String mem_id);
	
	void orderSave(OrderVO o_vo, PaymentVO p_vo);
}
