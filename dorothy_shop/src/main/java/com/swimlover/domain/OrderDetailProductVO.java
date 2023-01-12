package com.swimlover.domain;

import lombok.Data;

// 주문관리 : 주문상세정보에서 주문상세상품정보를 사용
@Data
public class OrderDetailProductVO {
	
	private OrderDetailVO orderDetailVO; // 주문상세 클래스
	private ProductVO productVO; // 상품 클래스

}
