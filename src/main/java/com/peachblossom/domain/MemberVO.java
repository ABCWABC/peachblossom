package com.peachblossom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	/** 회원 아이디 */
	private	String mb_id;
	
	/** 회원 비밀번호 */
	private String mb_password;
	
	/** 회원 이름 */
	private String mb_name;
	
	/** 회원 이메일 */
	private String mb_email;
	
	/** 회원 우편번호 */
	private String mb_zipcode;
	
	/** 회원 기본주소 */
	private String mb_addr;
	
	/** 회원 상세주소 */
	private String mb_addr_d;
	
	/** 회원 전화번호 앞자리 */
	private String mb_mobile1;
	/** 회원 전화번호 중간자리 */
	private String mb_mobile2;
	/** 회원 전화번호 끝자리 */
	private String mb_mobile3;
	
	/** 회원 이메일 수신여부 */
	private String mb_accept_e;
	
	/** 회원 적립금 */
	private int	 mb_point;
	
	/** 회원 가입일 */
	private Date mb_date_sub;
	
	/** 회원 수정일 */
	private Date mb_date_upd;
	
	/** 회원 최근 접속일 */
	private Date mb_date_last;
	
}
