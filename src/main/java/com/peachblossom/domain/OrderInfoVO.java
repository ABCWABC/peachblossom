package com.peachblossom.domain;

import lombok.Data;

@Data
public class OrderInfoVO {
	
	private Integer pro_num;
	private String pro_name;
	private int	pro_price;
	private String pro_img;
	private String pro_uploadpath;
	private int cart_amount;
	private int orderprice;
}
