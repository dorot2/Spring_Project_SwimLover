package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.OrderVO;
import com.swimlover.dto.Criteria;
import com.swimlover.mapper.AdOrderMapper;

import lombok.Setter;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	@Setter(onMethod_= {@Autowired})
	private AdOrderMapper adOrderMapper;
	
	@Override
	public List<OrderVO> getOrderList(Criteria cri) {
		return adOrderMapper.getOrderList(cri);
	}
	
	@Override
	public int getOrderTotalCount(Criteria cri) {
		return adOrderMapper.getOrderTotalCount(cri);
	}
}
