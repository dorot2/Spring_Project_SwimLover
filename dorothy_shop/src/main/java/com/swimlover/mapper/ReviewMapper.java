package com.swimlover.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swimlover.domain.ReviewVO;
import com.swimlover.dto.Criteria;

public interface ReviewMapper {
	
	void create(ReviewVO vo);
	
	List<ReviewVO> list(@Param("pdt_num") Integer pdt_num, @Param("cri") Criteria cri);

	int listCount(Integer pdt_num);
}
