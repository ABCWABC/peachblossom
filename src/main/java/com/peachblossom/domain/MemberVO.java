package com.peachblossom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	//mb_id, mb_password, mb_name, mb_email, mb_zipcode, mb_addr, mb_addr_d, 
	// mb_mobile1, mb_mobile2, mb_mobile3, mb_accept_e, mb_point, mb_date_sub, mb_date_upd, mb_date_last

	private	String mb_id;
	private String mb_password;
	private String mb_name;
	private String mb_email;
	private String mb_zipcode;
	private String mb_addr;
	private String mb_addr_d;
	private String mb_mobile1;
	private String mb_mobile2;
	private String mb_mobile3;
	private String mb_accept_e;
	private int	 mb_point;
	private Date mb_date_sub;
	private Date mb_date_upd;
	private Date mb_date_last;
	
}
