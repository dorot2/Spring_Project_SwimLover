package com.swimlover.service;

import com.swimlover.dto.EmailDTO;

public interface EmailService {
	
	void sendMail(EmailDTO dto, String message);
	
	
	
}
