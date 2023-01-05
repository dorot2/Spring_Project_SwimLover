package com.swimlover.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swimlover.domain.CartVO;
import com.swimlover.domain.CartVOList;

public interface CartService {

	void cart_add(CartVO vo);
	
	List<CartVOList> cart_list(String mem_id);
	
	void cart_qty_change(Long cart_code, int cart_amount);
	
	void cart_delete(Long cart_code);
	
	void cart_empty(String mem_id);
	
	void cart_sel_delete(List<Long> cart_code_arr);
}
