package com.peachblossom.sevice;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.peachblossom.domain.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo);
	
	public String checkID(String mb_id);
	
	public MemberVO login(String mb_id);
	
	public int modify(MemberVO vo);
	
	public String searchPwByEmail(String mb_email);
	
	public int changePw(String mb_email, String mb_password);
	
	public String currentPwConfirm(String mb_id, PasswordEncoder cryptPassEnc, String cur_mb_password, String change_mb_password);
	
	public int regDelete(String mb_id, PasswordEncoder cryptPassEnc, String mb_password);

}
