package com.peachblossom.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	// pro_num, cate_prt_code, cate_code, pro_name, pro_price, pro_discount, pro_publisher,
	// pro_content, pro_img, pro_uploadpath, pro_amount, pro_buy, pro_date, pro_updatedate
	
	private Integer	pro_num;
	private Integer	cate_prt_code;
	private Integer	cate_code;
	private String pro_name;
	private int	pro_price;
	private int pro_discount;
	private String pro_publisher;
	private String pro_content;
	private String pro_img;
	private String pro_uploadpath;
	private int pro_amount;
	private String pro_buy;
	private Date pro_date;
	private Date pro_updatedate;
	
	private MultipartFile upload;

}
