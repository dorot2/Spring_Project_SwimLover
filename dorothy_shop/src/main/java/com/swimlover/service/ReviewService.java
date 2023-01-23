package com.swimlover.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swimlover.domain.ReviewVO;
import com.swimlover.dto.Criteria;

public interface ReviewService {

	void create(ReviewVO vo);
	
	List<ReviewVO> list(Integer pdt_num, Criteria cri);
	
	int listCount(Integer pdt_num);
	
	int delete(Long rv_num);
	
	int update(ReviewVO vo);
}
