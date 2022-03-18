package com.peachblossom.domain;

import lombok.Data;

@Data
public class OrderDetail {
	
	//ord_code, pro_num, dt_amount, dt_price
	
	private Integer ord_code;
	private Integer pro_num;
	private int dt_amount;
	private int dt_price;
}
