package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.CartVO;
import com.swimlover.domain.CartVOList;
import com.swimlover.mapper.CartMapper;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = {@Autowired})
	private CartMapper cartMapper;

	@Override
	public void cart_add(CartVO vo) {
		cartMapper.cart_add(vo);
	}

	@Override
	public List<CartVOList> cart_list(String mem_id) {
		return cartMapper.cart_list(mem_id);
	}

	@Override
	public void cart_qty_change(Long cart_code, int cart_amount) {
		cartMapper.cart_qty_change(cart_code, cart_amount);
	}

	@Override
	public void cart_delete(Long cart_code) {
		cartMapper.cart_delete(cart_code);
	}

	@Override
	public void cart_empty(String mem_id) {
		cartMapper.cart_empty(mem_id);
	}

	@Override
	public void cart_sel_delete(List<Long> cart_code_arr) {
		cartMapper.cart_sel_delete(cart_code_arr);
	}
	
	
}
