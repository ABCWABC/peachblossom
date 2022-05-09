package com.peachblossom.mapper;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.MemberVO;

public interface MemberMapper {
	
	/** 회원가입한다. */
	public int join(MemberVO vo) throws Exception;
	
	/** 회원가입시 아이디 중복체크를 한다. */
	public String checkID(String mb_id) throws Exception;
	
	/** 로그인을 한다. */
	public MemberVO login(String mb_id) throws Exception;
	
	/** 회원정보를 수정한다. */
	public int modify(MemberVO vo) throws Exception;
	
	/** 비밀번호를 찾는다. */
	public String searchPwByEmail(@Param("mb_id") String mb_id, @Param("mb_name") String mb_name, @Param("mb_email") String mb_email) throws Exception;
	
	/** 아이디를 찾는다. */
	public String searchIdByEmail(String mb_email) throws Exception;
	
	/** 비밀번호찾기시 메일에 전송된 임의번호로 비밀번호를 변경한다. */
	public int changePw(@Param("mb_email") String mb_email, @Param("mb_password") String mb_password) throws Exception;
	
	/** 비밀번호를 재확인 한다. */
	public String currentPwConfirm(String mb_id) throws Exception;
	
	/** 회원정보수정에서 비밀번호를 변경 한다. */
	public int changeNewPw(@Param("mb_id") String mb_id, @Param("change_mb_password") String change_mb_password) throws Exception;
	
	/** 회원탈퇴한다. */
	public int regDelete(String mb_id) throws Exception;

}
