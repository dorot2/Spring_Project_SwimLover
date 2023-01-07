package com.swimlover.mapper;

import org.apache.ibatis.annotations.Param;

import com.swimlover.domain.CartVO;
import com.swimlover.domain.CartVOList;
import com.swimlover.domain.OrderDetailVO;
import com.swimlover.domain.OrderVO;
import com.swimlover.domain.PaymentVO;

public interface OrderMapper {

	// 1) 주문정보 저장하기
	void orderSave(OrderVO vo);
	
	// 2 - 1) 주문상세 저장.  장바구니 테이블의 데이타를 참조해서 주문상세테이블에 저장
	void orderDetailSave(@Param("odr_code") Long odr_code, @Param("mem_id") String mem_id);
	
	// 2 - 2) 주문상세 저장.  바로구매에서 주문상세 저장하기(장바구니 사용X)
	void orderDirectDetailSave(OrderDetailVO vo);
	
	// 3) 결제정보 저장
	void paymentSave(PaymentVO vo);
	
	// 바로구매에서 보여줄 주문내역
	CartVOList directOrder(CartVO vo);
	
	// 시퀌스 가져오기
	long getOrderSequence();
}
