package com.swimlover.domain;

import lombok.Data;

@Data
public class OrderDetailVOList {

	private Long odr_code;
	private Integer pdt_num;
	private String pdt_name;
	private int pdt_price;
	private int odr_amount;
	private int odr_price;
	private String pdt_img_folder;
	private String pdt_img;

}
