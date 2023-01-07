package com.swimlover.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.dto.Criteria;

public interface ProductMapper {

	// 1차 카테고리 목록
	List<CategoryVO> getCategoryList();
	
	// 1차 카테고리를 참조하는 2차 카테고리 목록
	List<CategoryVO> getSubCategoryList(Integer cate_code);
	
	// 2차 카테고리를 참조하는 상품목록
	List<ProductVO> getProductListbysubCategory(@Param("cate_code") Integer cate_code, @Param("cri") Criteria cri);
	
	// 2차 카테고리를 참조하는 상품목록의 개수
	int getProductCountbysubCategory(@Param("cate_code") Integer cate_code, @Param("cri") Criteria cri);
	
	// 상품상세정보
	ProductVO getProductDetail(Integer pdt_num);
	
}
