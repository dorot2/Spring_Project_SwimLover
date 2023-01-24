package com.swimlover.service;

import com.swimlover.domain.MemberVO;

public interface MemberService {

	String idCheck(String mem_id);
	
	void join(MemberVO vo);
	
	MemberVO login_ok(String mem_id);
	
	String getIDEmailExists(String mem_id, String mem_email);
	
	void changePW(String mem_id, String enc_pw);
	
	void modify(MemberVO vo);
	
	// 로그인 시간 업데이트
	void loginTimeUpdate(String mem_id);
	
	int getOrderTotalPrice(String mem_id);
	
	String searchID(String mem_name, String mem_email);
}
