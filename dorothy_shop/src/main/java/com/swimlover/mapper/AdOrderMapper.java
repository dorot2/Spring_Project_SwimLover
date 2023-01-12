package com.swimlover.mapper;

import java.util.List;

import com.swimlover.domain.OrderVO;
import com.swimlover.dto.Criteria;

public interface AdOrderMapper {
	
	List<OrderVO> getOrderList(Criteria cri);
	
	int getOrderTotalCount(Criteria cri);

}
