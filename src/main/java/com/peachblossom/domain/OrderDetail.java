package com.peachblossom.domain;

import lombok.Data;

@Data
public class OrderDetail {
	
	/** 주문 코드 */	
	private Integer ord_code;
	
	/** 제품 번호 */
	private Integer pro_num;
	
	/** 주문상세-주문수량 */
	private int dt_amount;
	
	/** 주문상세-주문가격 */
	private int dt_price;
}
