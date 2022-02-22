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

	@Override
	public AdminVO adminLogin(String ad_userid) {
		return mapper.adminLogin(ad_userid);
	}

	@Override
	public int adminRegister(AdminVO vo) {
		return mapper.adminRegister(vo);
	}

}
