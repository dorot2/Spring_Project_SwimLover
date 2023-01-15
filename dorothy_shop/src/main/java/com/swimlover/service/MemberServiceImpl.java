package com.swimlover.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swimlover.domain.MemberVO;
import com.swimlover.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = {@Autowired})
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
