package com.swimlover.service;

import java.util.List;

import com.swimlover.domain.OrderVO;
import com.swimlover.dto.Criteria;

public interface AdOrderService {

	List<OrderVO> getOrderList(Criteria cri);
	
	int getOrderTotalCount(Criteria cri);
}
