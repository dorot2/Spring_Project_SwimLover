package com.swimlover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.mapper.AdProductMapper;

import lombok.Setter;

@Service
public class AdProductServiceImpl implements AdProductService {

	@Setter(onMethod_ = {@Autowired})
	private AdProductMapper adProductMapper;

	@Override
	public List<CategoryVO> getCategoryList() {
		return adProductMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> getSubCategoryList(Integer cate_code) {
		// TODO Auto-generated method stub
		return adProductMapper.getSubCategoryList(cate_code);
	}

	@Override
	public void productInsert(ProductVO vo) {
		// TODO Auto-generated method stub
		adProductMapper.productInsert(vo);
	}
}
