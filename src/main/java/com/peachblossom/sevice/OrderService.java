package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.OrderDetailList;
import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.domain.OrderVO;

public interface OrderService {
	
	/** 장바구니페이지부터 전달된 주문페이지 내용을 가져온다. */
	public List<OrderInfoVO> orderInfo(String mb_id) throws Exception;
	
	/** 주문내역을 등록한다. */
	public void orderInsert(OrderVO vo, OrderDetailList vo2) throws Exception;
	
	/** 메인페이지부터 전달된 주문페이지 내용을 가져온다. */
	public List<OrderInfoVO> directOrderInfo(Integer pro_num, Integer ord_amount) throws Exception;
}
