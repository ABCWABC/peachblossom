package com.peachblossom.domain;

import lombok.Data;

@Data
public class OrderDetailInfo {
	
	/** 주문 코드 */
	private Integer ord_code;
	
	/** 제품 이름 */
	private String pro_name;
	
	/** 제품 번호 */
	private Integer pro_num;
	
	/** 주문상세-주문수량 */
	private int	 dt_amount;
	
	/** 주문상세-주문가격 */
	private int dt_price;
	
	/** 제품 업로드 경로 */
	private String pro_uploadpath;
	
	/** 제품 이미지 */
	private String pro_img;

}
