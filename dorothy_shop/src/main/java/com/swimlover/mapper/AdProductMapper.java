package com.swimlover.mapper;

import java.util.List;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;

public interface AdProductMapper {

	// 1차 카테고리 목록
	List<CategoryVO> getCategoryList();
	
	// 1차 카테고리를 참조하는 2차 카테고리 목록
	List<CategoryVO> getSubCategoryList(Integer cate_code);
	
	// 상품정보 저장
	void productInsert(ProductVO vo);
}
