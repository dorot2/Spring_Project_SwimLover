package com.swimlover.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.dto.Criteria;
import com.swimlover.dto.PageDTO;
import com.swimlover.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/product/*")
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	// 1차 카테고리를 참조하는 2차 카테고리 목록
	@ResponseBody
	@GetMapping("/subCategoryList/{cate_code}")
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cate_code") Integer cate_code) {
		
		log.info("1차 카테고리코드 : " + cate_code);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(productService.getSubCategoryList(cate_code), HttpStatus.OK);
		
		return entity;
	}
	
	// 2차 카테고리를 참조하는 상품리스트
	@GetMapping("/productList/{cate_code}/{cate_name}")
	public String productList(@ModelAttribute("cri")Criteria cri, @PathVariable("cate_code") Integer cate_code, 
								@PathVariable("cate_name") String cate_name, Model model) {
		log.info("2차 카테고리 코드 : " + cate_code);
		log.info("2차 카테고리 이름 : " + cate_name);
		
		// 2차 카테고리 이름
		model.addAttribute("cate_name", cate_name);
		
		// 1) 상품목록
		List<ProductVO> productList = productService.getProductListbysubCategory(cate_code, cri);
		
		// 역슬래시 -> 슬래시로 변환 사용
		productList.forEach(vo -> {
			vo.setPdt_img_folder(vo.getPdt_img_folder().replace("\\", "/"));
		});
		
		model.addAttribute("productList", productList);
		
		// 2) 페이징 작업
		int totalCount = productService.getProductCountbysubCategory(cate_code, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		return "/product/productList"; 
		
	}
	

	
	
	
}
