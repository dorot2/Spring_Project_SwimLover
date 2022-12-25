package com.swimlover.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {

	private Integer pdt_num;
	private Integer cate_code;
	private Integer cate_code_prt;
	private String pdt_name;
	private int pdt_price;
	private int pdt_discount;
	private String pdt_company;
	private String pdt_detail;
	private String pdt_img_folder;
	private String pdt_img;
	private int pdt_amount;
	private String pdt_buy;
	private Date pdt_date_sub;
	private Date pdt_date_up;
	
	// 파일업로드 필드
	private MultipartFile uploadFile;

}
