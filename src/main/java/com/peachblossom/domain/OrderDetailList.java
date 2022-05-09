package com.peachblossom.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailList {
	
	/** 주문상세리스트 */
	private List<OrderDetail> orderDetailList;

}
