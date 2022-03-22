package com.peachblossom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	// ord_code, mb_id, ord_name, ord_zipcode, ord_addr_basic, ord_addr_detail, 
	// ord_tel, ord_price, ord_message, ord_state, ord_regdate
	
	private Integer ord_code;
	private String mb_id;
	private String ord_name;
	private String ord_zipcode;
	private String ord_addr_basic;
	private String ord_addr_detail;
	private String ord_tel;
	private int ord_price;
	private String ord_message;
	private String ord_state;
	private String ord_depositor;
	private Date ord_regdate;
}
