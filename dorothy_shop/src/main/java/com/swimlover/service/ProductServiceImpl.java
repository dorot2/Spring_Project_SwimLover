package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.dto.Criteria;
import com.swimlover.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<CategoryVO> getCategoryList() {
		return productMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> getSubCategoryList(Integer cate_code) {
		return productMapper.getSubCategoryList(cate_code);
	}

	@Override
	public List<ProductVO> getProductListbysubCategory(Integer cate_code, Criteria cri) {
		return productMapper.getProductListbysubCategory(cate_code, cri);
	}

	@Override
	public int getProductCountbysubCategory(Integer cate_code, Criteria cri) {
		return productMapper.getProductCountbysubCategory(cate_code, cri);
	}
	
	
	
}
