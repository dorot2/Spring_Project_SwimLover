package com.swimlover.service;

import com.swimlover.domain.AdminVO;

public interface AdminService {
	
	AdminVO admin_ok(String admin_id);
	
	void login_update(String admin_id);

}
