package com.swimlover.service;

import java.util.List;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.dto.Criteria;

public interface AdProductService {

	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> getSubCategoryList(Integer cate_code);
	
	void productInsert(ProductVO vo);
	
	List<ProductVO> getProductList(Criteria cri);
		
	int getProductTotalCount(Criteria cri);

	ProductVO getProductByNum(Integer pdt_num);

	void productModify(ProductVO vo);
	
	void productDelete(Integer pdt_num);
	
	void btnSalesYN(Integer pdt_num, String pdt_buy);
}
