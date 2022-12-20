package com.swimlover.service;

import com.swimlover.domain.MemberVO;

public interface MemberService {

	String idCheck(String mem_id);
	
	void join(MemberVO vo);
	
	MemberVO login_ok(String mem_id);
	
	String getIDEmailExists(String mem_id, String mem_email);
	
	void changePW(String mem_id, String enc_pw);
}
