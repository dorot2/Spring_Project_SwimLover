package com.swimlover.service;

import java.util.List;

import com.swimlover.domain.OrderDetailProductVO;
import com.swimlover.domain.OrderDetailVOList;
import com.swimlover.domain.PaymentVO;
import com.swimlover.domain.OrderVO;
import com.swimlover.dto.Criteria;

public interface AdOrderService {

	List<OrderVO> getOrderList(Criteria cri, String startDate, String endDate, String odr_status);
	
	int getOrderTotalCount(Criteria cri, String startDate, String endDate, String odr_status);
	
	void orderStatusChange(Long odr_code, String odr_status);
	
	int orderStatusCount(String odr_status);
	
	//주문상세정보1
	List<OrderDetailVOList> getOrderDetailList1(Long odr_code);
	//주문상세정보2
	List<OrderDetailProductVO> getOrderDetailList2(Long odr_code);
	
	
	//결제정보
	PaymentVO getPayment(Long odr_code);
	//주문정보
	OrderVO getOrder(Long odr_code);
	
	void pay_memo(Integer pay_code, String pay_memo);
	
	
	// 주문삭제
	void orderInfoDelete(Long odr_code);
	
	// 주문 개별삭제
	void orderDetailProductDelete(Long odr_code, Integer pdt_num, int odr_price);
}
