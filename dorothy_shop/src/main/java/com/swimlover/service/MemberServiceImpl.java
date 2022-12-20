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
		// TODO Auto-generated method stub
		return memberMapper.idCheck(mem_id);
	}
	
	@Override
	public void join(MemberVO vo) {
		// TODO Auto-generated method stub
		memberMapper.join(vo);
	}

	@Override
	public MemberVO login_ok(String mem_id) {
		// TODO Auto-generated method stub
		return memberMapper.login_ok(mem_id);
	}

	@Override
	public String getIDEmailExists(String mem_id, String mem_email) {
		// TODO Auto-generated method stub
		return memberMapper.getIDEmailExists(mem_id, mem_email);
	}

	@Override
	public void changePW(String mem_id, String enc_pw) {
		// TODO Auto-generated method stub
		memberMapper.changePW(mem_id, enc_pw);
	}

	
	
}
