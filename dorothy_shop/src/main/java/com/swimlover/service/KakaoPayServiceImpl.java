package com.swimlover.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.swimlover.kakaopay.ApproveResponse;
import com.swimlover.kakaopay.ReadyResponse;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class KakaoPayServiceImpl {

	// 첫번째 요청주소(결제 준비)
	public ReadyResponse payReady(Long odr_code, String itemName, int quantity, String mem_id, int totalAmount) {
		// String order_id = "100";
		
		log.info("주문번호: " + odr_code);
		log.info("주문상품명:" + itemName);
		log.info("수량:" + quantity);
		log.info("아이디: " + mem_id);
		log.info("총금액: " + totalAmount);
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME"); 
		parameters.add("partner_order_id", String.valueOf(odr_code)); 
		parameters.add("partner_user_id", mem_id); 
		parameters.add("item_name", itemName); 
		parameters.add("quantity", String.valueOf(quantity)); 
		parameters.add("total_amount", String.valueOf(totalAmount)); 
		parameters.add("tax_free_amount", "0"); 
		parameters.add("approval_url", "http://localhost:8000/order/orderApp"); 
		parameters.add("cancel_url", "http://localhost:8000/order/orderCancel"); 
		parameters.add("fail_url", "http://localhost:8000/order/orderFail"); 
		
		// 헤더와 파라미터 정보 구성
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
		// 외부 API 통신
		RestTemplate template = new RestTemplate();
		
		// 1차 요청주소
		String url = "https://kapi.kakao.com/v1/payment/ready";
		
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		
		return readyResponse;
	}
	
	// 요청 헤더정보
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 02ebdefd8aff84de4cba8f65ddc6ef3d");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
	
	// 두번째 요청(결제승인 요청)
	public ApproveResponse payApprove(Long odr_code, String tid, String pgToken, String mem_id) {
		
		//String order_id = "100";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");  // 가맹점 코드, 10자. 제휴를 맺게되면, 회사담당자에게 문의를 하여 가맹점코드를 변경한다.
		parameters.add("tid", tid); 
		parameters.add("partner_order_id", String.valueOf(odr_code)); // 가맹점 주문번호, 최대 100자
		parameters.add("partner_user_id", mem_id); // 가맹점 회원 id, 최대 100자
		// 결제승인 요청을 인증하는 토큰
		parameters.add("pg_token", pgToken); // 상품 수량
		
	
		// 헤더와 파라미터정보를 구성.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
		//외부API통신
		RestTemplate template = new RestTemplate();
		//1차 요청주소
		String url = "https://kapi.kakao.com/v1/payment/approve";
		
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		
		return approveResponse;		
		
	}
	
	
}
