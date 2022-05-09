package com.peachblossom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {

	/** 관리자 아이디 */
	private String ad_userid;
	
	/** 관리자 비밀번호 */
	private String ad_userpw;
	
	/** 관리자 이름 */
	private String ad_name;
	
	/** 관리자 최종 로그인시간 */
	private Date ad_logintime;
	
}
