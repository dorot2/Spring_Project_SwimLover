package com.swimlover.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swimlover.domain.CategoryVO;
import com.swimlover.service.AdProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/product/*")
@Controller
public class AdProductController {

	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
	// 상품등록페이지
	@GetMapping("/productInsert")
	public void productInsert(Model model) {
		
		// 1차 카테고리 목록
		List<CategoryVO> categoryList = adProductService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
	}
	
	// 1차 카테고리를 참조하는 2차 카테고리 목록
	@ResponseBody
	@GetMapping("/subCategoryList/{cate_code}")
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cate_code") Integer cate_code) {
		
		log.info("1차 카테고리 코드 : " + cate_code);
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adProductService.getSubCategoryList(cate_code), HttpStatus.OK);
		return entity;
	}
	
}
