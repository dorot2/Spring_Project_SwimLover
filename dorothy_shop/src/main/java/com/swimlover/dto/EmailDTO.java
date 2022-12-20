package com.swimlover.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class EmailDTO {
	
	private String senderName;
	private String senderMail;
	private String receiverMail;
	private String subject;
	private String message;
	
	public EmailDTO() {
		this.senderName = "SwimLover";
		this.senderMail = "SwimLover";
		this.subject = "SwimLover 회원가입 메일 인증코드입니다 :)";
		this.message = "메일 인증을 위한 인증코드를 확인하시고, 인증코드 입력란에 입력하세요.";
	}
	
}
