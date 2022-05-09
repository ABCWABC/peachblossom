package com.peachblossom.domain;

import lombok.Data;

@Data
public class CartListVO {
	
	/** 장바구니 코드 */
	private Long cart_code;
	
	/** 제품번호 */
	private Integer pro_num;
	
	/** 회원 아이디 */
	private String mb_id;
	
	/** 장바구니 수량 */
	private int cart_amount;
	
	/** 제품 이름 */
	private String pro_name;
	
	/** 제품 이미지 */
	private String pro_img;
	
	/** 제품 업로드 경로 */
	private String pro_uploadpath;
	
	/** 제품 가격 */
	private int pro_price;
	
	/** 제품 할인 */
	private int pro_discount;

}
