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

	/** 회원가입한다. */
	@Override
	public int join(MemberVO vo) throws Exception {
		return mapper.join(vo);
	}

	/** 회원가입시 아이디 중복체크를 한다. */
	@Override
	public String checkID(String mb_id) throws Exception {
		return mapper.checkID(mb_id);
	}

	/** 로그인을 한다. */
	@Override
	public MemberVO login(String mb_id) throws Exception {
		return mapper.login(mb_id);
	}

	/** 회원정보를 수정한다. */
	@Override
	public int modify(MemberVO vo) throws Exception {
		return mapper.modify(vo);
	}

	/** 비밀번호를 찾는다. */
	@Override
	public String searchPwByEmail(String mb_id, String mb_name, String mb_email) throws Exception {
		return mapper.searchPwByEmail(mb_id, mb_name, mb_email);
	}
	
	/** 아이디를 찾는다. */
	@Override
	public String searchIdByEmail(String mb_email) throws Exception {
		return mapper.searchIdByEmail(mb_email);
	}

	/** 비밀번호찾기시 메일에 전송된 임의번호로 비밀번호를 변경한다. */
	@Override
	public int changePw(String mb_email, String mb_password) throws Exception {
		return mapper.changePw(mb_email, mb_password);
	}

	/** 비밀번호를 재확인 한다. */
	@Override
	public String currentPwConfirm(String mb_id, PasswordEncoder cryptPassEnc, String cur_mb_password,
			String change_mb_password) throws Exception {
		
		String result = "noPw";
		
		if(cryptPassEnc.matches(cur_mb_password, mapper.currentPwConfirm(mb_id))){
			mapper.changeNewPw(mb_id, change_mb_password);
			result = "success";
		}
		
		return result;
	}

	/** 회원탈퇴한다. */
	@Override
	public int regDelete(String mb_id, PasswordEncoder cryptPassEnc, String mb_password) throws Exception {
		
		int count = 0;
		
		if(cryptPassEnc.matches(mb_password, mapper.currentPwConfirm(mb_id))) {
			count = mapper.regDelete(mb_id);
		}
		
		log.info("count" + count);
		
		return count;
	}

}
