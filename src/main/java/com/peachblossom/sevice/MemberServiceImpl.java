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
		return mapper.join(vo);
	}

	@Override
	public String checkID(String mb_id) {
		return mapper.checkID(mb_id);
	}

	@Override
	public MemberVO login(String mb_id) {
		return mapper.login(mb_id);
	}

	@Override
	public int modify(MemberVO vo) {
		return mapper.modify(vo);
	}

	@Override
	public String searchPwByEmail(String mb_email) {
		return mapper.searchPwByEmail(mb_email);
	}

	@Override
	public int changePw(String mb_email, String mb_password) {
		return mapper.changePw(mb_email, mb_password);
	}

	@Override
	public String currentPwConfirm(String mb_id, PasswordEncoder cryptPassEnc, String cur_mb_password,
			String change_mb_password) {
		
		String result = "noPw";
		
		if(cryptPassEnc.matches(cur_mb_password, mapper.currentPwConfirm(mb_id))){
			mapper.changeNewPw(mb_id, change_mb_password);
			result = "success";
		}
		
		return result;
	}

	@Override
	public int regDelete(String mb_id, PasswordEncoder cryptPassEnc, String mb_password) {
		
		int count = 0;
		
		if(cryptPassEnc.matches(mb_password, mapper.currentPwConfirm(mb_id))) {
			count = mapper.regDelete(mb_id);
		}
		
		log.info("count" + count);
		System.out.println("count" + count);
		
		return count;
	}

}
