package com.swimlover.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.swimlover.domain.CategoryVO;
import com.swimlover.service.ProductService;

@ControllerAdvice(basePackages = {"com.swimlover.controller"})
public class GlobalControllerAdvice {
	
	@Autowired
	private ProductService productService;
	
	// 1차 카테고리 목록을 읽어오는 작업.
	@ModelAttribute
	public void categoryList(Model model) {
		
		List<CategoryVO> cateList = productService.getCategoryList();
		model.addAttribute("mainCateList", cateList);
	}

}
