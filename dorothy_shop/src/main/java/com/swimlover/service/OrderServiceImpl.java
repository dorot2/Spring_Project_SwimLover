package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.CartVOList;
import com.swimlover.mapper.CartMapper;
import com.swimlover.mapper.OrderMapper;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_= {@Autowired})
	private OrderMapper orderMapper;
	
	// cartmapper 주입
	@Setter(onMethod_= {@Autowired})
	private CartMapper cartMapper;

	@Override
	public List<CartVOList> cart_list(String mem_id) {
		return cartMapper.cart_list(mem_id);
	}
	
	
}
