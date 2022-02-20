package com.peachblossom.sevice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.peachblossom.domain.MemberVO;
import com.peachblossom.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public int join(MemberVO vo) {
		return 0;
	}

	@Override
	public String checkID(String mb_id) {
		return null;
	}

	@Override
	public MemberVO login(String mb_id) {
		return null;
	}

	@Override
	public int modify(MemberVO vo) {
		return 0;
	}

	@Override
	public String searchPwByEmail(String mb_email) {
		return null;
	}

	@Override
	public int changePw(String mb_email, String mb_password) {
		return 0;
	}

	@Override
	public String currentPwConfirm(String mb_id, PasswordEncoder cryptPassEnc, String cur_mb_password,
			String change_mb_password) {
		return null;
	}

	@Override
	public int regDelete(String mb_id, PasswordEncoder cryptPassEncm, String mb_password) {
		return 0;
	}

}
