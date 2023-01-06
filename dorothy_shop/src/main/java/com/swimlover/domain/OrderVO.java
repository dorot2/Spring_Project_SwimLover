package com.swimlover.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	// odr_code, mem_id, odr_name, odr_zipcode, 
	// odr_addr, odr_addr_d, odr_phone, 
	//odr_total_price, odr_status, payment_status, odr_date
	
	private Long odr_code;
	private String mem_id;
	private String odr_name;
	private String odr_zipcode;
	private String odr_addr;
	private String odr_addr_d;
	private String odr_phone;
	private int odr_total_price;
	private Date odr_date;
	
	private String odr_status; // 주문상태
	private String payment_status; // 결제상태
	
}
