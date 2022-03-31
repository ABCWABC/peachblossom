package com.peachblossom.domain;

import lombok.Data;

@Data
public class OrderDetailInfo {
	
	private Integer ord_code;
	private String pro_name;
	private Integer pro_num;
	private int	 dt_amount;
	private int dt_price;
	private String pro_uploadpath;
	private String pro_img;

}
