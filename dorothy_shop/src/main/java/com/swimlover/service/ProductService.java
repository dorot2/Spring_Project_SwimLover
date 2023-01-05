package com.swimlover.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.dto.Criteria;

public interface ProductService {

	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> getSubCategoryList(Integer cate_code);
	
	List<ProductVO> getProductListbysubCategory(Integer cate_code, Criteria cri);
	
	int getProductCountbysubCategory(Integer cate_code, Criteria cri);
	
}
