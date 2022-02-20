package com.peachblossom.mapper;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.MemberVO;

public interface MemberMapper {
	
	public int join(MemberVO vo);
	
	public String checkID(String mb_id);
	
	public MemberVO login(String mb_id);
	
	public int modify(MemberVO vo);
	
	public String searchPwByEmail(String mb_email);
	
	public int changePw(@Param("mb_email") String mb_email, @Param("mb_password") String mb_password);
	
	public String currentPwConfirm(String mbsp_id);
	
	public int changeNewPw(@Param("mb_id") String mb_id, @Param("change_mb_password") String change_mb_password);
	
	public int regDelete(String mb_id);

}
