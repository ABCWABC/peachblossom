package com.peachblossom.domain;

import lombok.Data;

@Data
public class CartListVO {
	
	/*
	 c.cart_code, c.pro_num, c.mb_id, c.cart_amount, 
     p.pro_num, p.cate_prt_code, p.cate_code, p.pro_name, p.pro_price, p.pro_discount, p.pro_publisher, p.pro_content, 
     p.pro_img, p.pro_amount, p.pro_buy, p.pro_date, p.pro_updatedate, p.pro_uploadpath 
	 */
	
	private Long cart_code;
	private Integer pro_num;
	private String mb_id;
	private int cart_amount;
	private String pro_name;
	private String pro_img;
	private String pro_uploadpath;
	private int pro_price;
	private int pro_discount;

}
