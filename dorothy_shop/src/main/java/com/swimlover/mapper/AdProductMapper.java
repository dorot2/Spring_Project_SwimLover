package com.swimlover.mapper;

import java.util.List;

import com.swimlover.domain.CategoryVO;

public interface AdProductMapper {

	// 1차 카테고리 목록
	List<CategoryVO> getCategoryList();
	
	// 1차 카테고리를 참조하는 2차 카테고리 목록
	List<CategoryVO> getSubCategoryList(Integer cate_code);
}
