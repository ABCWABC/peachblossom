package com.peachblossom.domain;

import lombok.Data;

@Data
public class ChartVO {
	
	/** 카테고리 이름 */
	private String cate_name;
	
	/** 매출-카테고리별 */
	private int sales;
	
	/** 년도 */
	private String year;
	
	/** 매출-총매출 */
	private int totalprice;

}
