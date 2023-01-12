package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swimlover.domain.CartVO;
import com.swimlover.domain.CartVOList;
import com.swimlover.domain.OrderDetailProductVO;
import com.swimlover.domain.OrderDetailVO;
import com.swimlover.domain.OrderVO;
import com.swimlover.domain.PaymentVO;
import com.swimlover.dto.Criteria;
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

	// 서비스 메서드 안에서 하나라도 에러 발생시 정상적으로 실행되는 다른 메서드 작업도 롤백처리 시키는 기능
	@Transactional
	@Override
	public void orderSave(OrderVO o_vo, PaymentVO p_vo) {

		// 1) 주문정보 저장하기
		orderMapper.orderSave(o_vo);
		
		// 2) 주문상세 저장하기
		orderMapper.orderDetailSave(o_vo.getOdr_code(), o_vo.getMem_id());

		// 3) 결제정보 저장하기
		p_vo.setOdr_code(o_vo.getOdr_code());
		orderMapper.paymentSave(p_vo);
		
		// 4) 장바구니 비우기
		cartMapper.cart_empty(o_vo.getMem_id());
	}
	
	// 상품리스트에서 바로구매
	@Transactional
	@Override
	public void orderDirectSave(OrderVO o_vo, OrderDetailVO od_vo, PaymentVO p_vo) {
		// 1) 주문정보 저장하기
		orderMapper.orderSave(o_vo);
		
		// 2) 주문상세 저장하기
		orderMapper.orderDirectDetailSave(od_vo);

		// 3) 결제정보 저장하기
		p_vo.setOdr_code(o_vo.getOdr_code());
		orderMapper.paymentSave(p_vo);
		
	}

	@Override
	public CartVOList directOrder(CartVO vo) {
		return orderMapper.directOrder(vo);
	}
	
	@Override
	public long getOrderSequence() {
		return orderMapper.getOrderSequence();
	}

	@Override
	public int getOrderProcessCount(String mem_id) {
		return orderMapper.getOrderProcessCount(mem_id);
	}

	@Override
	public List<OrderVO> getOrderList(String mem_id, Criteria cri) {
		return orderMapper.getOrderList(mem_id, cri);
	}

	@Override
	public int getOrderTotalCount(String mem_id) {
		return orderMapper.getOrderTotalCount(mem_id);
	}

	@Override
	public List<OrderDetailProductVO> getOrderDetailList(Long odr_code) {
		return orderMapper.getOrderDetailList(odr_code);
	}



	
	
}
