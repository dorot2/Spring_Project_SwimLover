package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swimlover.domain.OrderDetailProductVO;
import com.swimlover.domain.OrderDetailVOList;
import com.swimlover.domain.PaymentVO;
import com.swimlover.mapper.AdPaymentMapper;
import com.swimlover.domain.OrderVO;
import com.swimlover.dto.Criteria;
import com.swimlover.mapper.AdOrderMapper;

import lombok.Setter;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	@Setter(onMethod_= {@Autowired})
	private AdOrderMapper adOrderMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private AdPaymentMapper adPaymentMapper;
	
	@Override
	public int getOrderTotalCount(Criteria cri, String odr_status, String startDate, String endDate) {
		return adOrderMapper.getOrderTotalCount(cri, odr_status, startDate, endDate);
	}

	@Override
	public void orderStatusChange(Long odr_code, String odr_status) {
		adOrderMapper.orderStatusChange(odr_code, odr_status);
	}

	@Override
	public int orderStatusCount(String odr_status) {
		return adOrderMapper.orderStatusCount(odr_status);
	}

	@Override
	public List<OrderVO> getOrderList(Criteria cri, String odr_status, String startDate, String endDate) {
		return adOrderMapper.getOrderList(cri, odr_status, startDate, endDate);
	}

	
	@Override
	public List<OrderDetailVOList> getOrderDetailList1(Long odr_code) {
		return adOrderMapper.getOrderDetailList1(odr_code);
	}
	
	
	@Override
	public List<OrderDetailProductVO> getOrderDetailList2(Long odr_code) {
		return adOrderMapper.getOrderDetailList2(odr_code);
	}
	
	

	@Override
	public PaymentVO getPayment(Long odr_code) {
		return adOrderMapper.getPayment(odr_code);
	}

	@Override
	public OrderVO getOrder(Long odr_code) {
		return adOrderMapper.getOrder(odr_code);
	}

	@Override
	public void pay_memo(Integer pay_code, String pay_memo) {
		adOrderMapper.pay_memo(pay_code, pay_memo);
	}

	// 주문 개별상품삭제 : 1)ORDER_DETAIL_TBL 상품삭제 2)ORDER_TBL 총주문금액 변경(차감) 3)PAYMENT_TBL 총주문금액 변경(차감)
	@Transactional
	@Override
	public void orderDetailProductDelete(Long odr_code, Integer pdt_num, int odr_price) {
		// TODO Auto-generated method stub
		
		adOrderMapper.orderDetailProductDelete(odr_code, pdt_num);
		adOrderMapper.orderTotalPriceChange(odr_code, odr_price);
		
		adPaymentMapper.orderPayTotalPriceChange(odr_code, odr_price);
		
	}

	
	//주문정보 삭제
	@Transactional
	@Override
	public void orderInfoDelete(Long odr_code) {
		
		adOrderMapper.orderDetailDelete(odr_code);
		adOrderMapper.paymentDelete(odr_code);
		
		adOrderMapper.orderDelete(odr_code);
	}
}
