package com.peachblossom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	/** 주문 코드 */
	private Integer ord_code;
	
	/** 회원 아이디 */
	private String mb_id;
	
	/** 주문자 이름 */
	private String ord_name;
	
	/** 주문자 우편번호 */
	private String ord_zipcode;
	
	/** 주문자 기본주소 */
	private String ord_addr_basic;
	
	/** 주문자 상세주소 */
	private String ord_addr_detail;
	
	/** 주문자 전화번호 앞자리 */
	private String ord_tel1;
	/** 주문자 전화번호 중간자리 */
	private String ord_tel2;
	/** 주문자 전화번호 뒷자리 */
	private String ord_tel3;
	
	/** 주문 가격 */
	private int ord_price;
	
	/** 배송메세지 */
	private String ord_message;
	
	/** 배송현황 */
	private String ord_state;
	
	/** 입금자 */
	private String ord_depositor;
	
	/** 주문일자 */
	private Date ord_regdate;
}
