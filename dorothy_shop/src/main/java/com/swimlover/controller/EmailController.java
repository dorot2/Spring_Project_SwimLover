package com.swimlover.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.swimlover.dto.EmailDTO;
import com.swimlover.service.EmailService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/email/*")
public class EmailController {

	// 주입
	@Setter(onMethod_ = {@Autowired})
	private EmailService emailService;
	
	// 메일인증 요청시 동작
	@GetMapping("/send") // 받는사람 메일주소
	public ResponseEntity<String> send(EmailDTO dto, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		// 인증코드 생성. 6자리
		String authCode = "";
		for(int i = 0; i < 6; i++) {
			authCode += String.valueOf((int)(Math.random()*10));
		}
		
		log.info("인증코드 : " + authCode);
		
		// 세션형태로 인증코드 저장
		session.setAttribute("authCode", authCode);
		
		try {
			emailService.sendMail(dto, authCode);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 사용자가 인증메일 확인 후 인증코드 입력시
	@PostMapping("/confirmAuthCode")
	public ResponseEntity<String> confirmAuthCode(String authCode, HttpSession session){
		ResponseEntity<String> entity = null;
	
		// 인증요청시 세션형태로 저장한 인증코드를 읽어와서, 사용자가 입력한 인증코드와 비교
		String confirm_authCode = (String) session.getAttribute("authCode");
		
		if(authCode.equals(confirm_authCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			session.removeAttribute("authCode");
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}
}
