package com.swimlover.service;

import java.util.List;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;

public interface AdProductService {

	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> getSubCategoryList(Integer cate_code);
	
	void productInsert(ProductVO vo);
}
