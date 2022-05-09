package com.peachblossom.domain;

import lombok.Data;

@Data
public class CartVO {
	
	/** 장바구니 코드 */
	private Long cart_code;
	
	/** 제품번호 */
	private Integer pro_num;
	
	/** 회원 아이디 */
	private String mb_id;
	
	/** 장바구니 수량 */
	private int cart_amount;

}
