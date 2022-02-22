package com.peachblossom.sevice;

import com.peachblossom.domain.AdminVO;

public interface AdminService {

	public AdminVO adminLogin(String ad_userid);
	
	public int adminRegister(AdminVO vo);
}
