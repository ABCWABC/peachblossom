package com.peachblossom.domain;

import lombok.Data;

@Data
public class CategoryVO {

	/** 장바구니 코드 */
	private Integer cate_code;
	
	/** 1차 카테고리 코드 */
	private Integer cate_prt_code;
	
	/** 카테고리 이름 */
	private String cate_name;
	
}
