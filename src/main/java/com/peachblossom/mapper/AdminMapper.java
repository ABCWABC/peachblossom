package com.peachblossom.mapper;

import com.peachblossom.domain.AdminVO;

public interface AdminMapper {

	public AdminVO adminLogin(String ad_userid);
	
	public int adminRegister(AdminVO vo);
	
}
