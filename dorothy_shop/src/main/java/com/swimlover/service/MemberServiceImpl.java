package com.swimlover.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.MemberVO;
import com.swimlover.mapper.MemberMapper;

import lombok.Setter;

// A회사
@Service
public class MemberServiceImpl implements MemberService {
 
	//주입작업 : 필드방식
	//@Autowired  롬복사용 안할 경우
	@Setter(onMethod_ =  {@Autowired})  // jdk 1.8 만 onMethod_
	private MemberMapper memberMapper;

	@Override
	public String idCheck(String mem_id) {
		return memberMapper.idCheck(mem_id);
	}

	@Override
	public void join(MemberVO vo) {
		memberMapper.join(vo);
	}

	@Override
	public MemberVO login_ok(String mem_id) {
		return memberMapper.login_ok(mem_id);
	}

	@Override
	public String getIDEmailExists(String mem_id, String mem_email) {
		return memberMapper.getIDEmailExists(mem_id, mem_email);
	}

	@Override
	public void changePW(String mem_id, String enc_pw) {
		memberMapper.changePW(mem_id, enc_pw);
	}

	@Override
	public void modify(MemberVO vo) {
		memberMapper.modify(vo);
	}

	@Override
	public void loginTimeUpdate(String mem_id) {
		memberMapper.loginTimeUpdate(mem_id);
	}

	@Override
	public int getOrderTotalPrice(String mem_id) {
		return memberMapper.getOrderTotalPrice(mem_id);
	}
}
