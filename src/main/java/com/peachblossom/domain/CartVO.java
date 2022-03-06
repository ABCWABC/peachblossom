package com.peachblossom.domain;

import lombok.Data;

@Data
public class CartVO {
	
	private Long cart_code;
	private Integer pro_num;
	private String mb_id;
	private int cart_amount;

}
