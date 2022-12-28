package com.swimlover.mapper;

import java.util.List;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.dto.Criteria;

public interface AdProductMapper {

	// 1차 카테고리 목록
	List<CategoryVO> getCategoryList();
	
	// 1차 카테고리를 참조하는 2차 카테고리 목록
	List<CategoryVO> getSubCategoryList(Integer cate_code);
	
	// 상품정보 저장
	void productInsert(ProductVO vo);
	
	// 상품목록
	List<ProductVO> getProductList(Criteria cri);
	
	// 상품개수
	int getProductTotalCount(Criteria cri);
	
	// 상품수정정보 가져오기
	ProductVO getProductByNum(Integer pdt_num);
	
	// 상품 수정하기
	void productModify(ProductVO vo);
	
	// 상품 삭제하기
	void productDelete(Integer pdt_num);
}
