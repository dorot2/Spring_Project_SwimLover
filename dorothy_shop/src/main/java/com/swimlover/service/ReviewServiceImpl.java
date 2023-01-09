package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.ReviewVO;
import com.swimlover.dto.Criteria;
import com.swimlover.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_= {@Autowired})
	private ReviewMapper reviewMapper;

	@Override
	public void create(ReviewVO vo) {
		reviewMapper.create(vo);
		
	}

	@Override
	public List<ReviewVO> list(Integer pdt_num, Criteria cri) {
		return reviewMapper.list(pdt_num, cri);
	}

	@Override
	public int listCount(Integer pdt_num) {
		return reviewMapper.listCount(pdt_num);
	}
}
