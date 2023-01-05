package com.swimlover.domain;

import lombok.Data;

@Data
public class CartVO {

	private Long cart_code;
	private Integer pdt_num;
	private String mem_id;
	private int cart_amount;
}
