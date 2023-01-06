package com.swimlover.mapper;

import org.apache.ibatis.annotations.Param;

import com.swimlover.domain.OrderVO;
import com.swimlover.domain.PaymentVO;

public interface OrderMapper {

	// 1) 주문정보 저장하기
	void orderSave(OrderVO vo);
	
	// 2) 주문상세 저장
	void orderDetailSave(@Param("odr_code") Long odr_code, @Param("mem_id") String mem_id);
	
	// 3) 결제정보 저장
	void paymentSave(PaymentVO vo);
}
