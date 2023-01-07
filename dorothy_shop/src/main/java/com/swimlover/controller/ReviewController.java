package com.swimlover.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.swimlover.mapper.ReviewMapper;
import com.swimlover.service.ReviewService;

import lombok.Setter;

@RequestMapping("/review/*")
@RestController // jsp 파일을 사용하지 않는다.
public class ReviewController {

	@Setter(onMethod_= {@Autowired})
	private ReviewService reviewService;
}
