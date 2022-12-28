package com.swimlover.mapper;

import com.swimlover.domain.AdminVO;

public interface AdminMapper {

	AdminVO admin_ok(String admin_id);
	
	void login_update(String admin_id);
}
