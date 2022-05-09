package com.peachblossom.sevice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachblossom.domain.AdminVO;
import com.peachblossom.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;

	/** 관리자계정 로그인을 처리 한다. */
	@Override
	public AdminVO adminLogin(String ad_userid) throws Exception {
		return mapper.adminLogin(ad_userid);
	}

	/** 관리자계정을 생성한다. */
	@Override
	public int adminRegister(AdminVO vo) throws Exception {
		return mapper.adminRegister(vo);
	}

}
