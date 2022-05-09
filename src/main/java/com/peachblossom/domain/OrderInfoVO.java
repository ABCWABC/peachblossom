package com.peachblossom.domain;

import lombok.Data;

@Data
public class OrderInfoVO {
	
	/** 제품 번호 */
	private Integer pro_num;
	
	/** 제품 이름 */
	private String pro_name;
	
	/** 제품 가격 */
	private int	pro_price;
	
	/** 제품 이미지 */
	private String pro_img;
	
	/** 제품 업로드경로 */
	private String pro_uploadpath;
	
	/** 장바구니 수량 */
	private int cart_amount;
	
	/** 주문가격 */
	private int orderprice;
}
