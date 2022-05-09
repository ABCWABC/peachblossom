package com.peachblossom.mapper;

import com.peachblossom.domain.AdminVO;

public interface AdminMapper {

	/** 관리자계정 로그인을 처리 한다. */
	public AdminVO adminLogin(String ad_userid) throws Exception;
	
	/** 관리자계정을 생성한다. */
	public int adminRegister(AdminVO vo) throws Exception;
	
}
