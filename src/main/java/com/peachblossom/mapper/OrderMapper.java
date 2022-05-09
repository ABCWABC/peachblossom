package com.peachblossom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.OrderDetail;
import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.domain.OrderVO;

public interface OrderMapper {
	
	/** 장바구니페이지부터 전달된 주문페이지 내용을 가져온다. */
	public List<OrderInfoVO> orderInfo(String mb_id) throws Exception;
	
	/** 주문내역을 등록한다. */
	public void orderInsert(OrderVO vo) throws Exception;
	
	/** 주문상세내역을 등록한다. */
	public void orderDetailInsert(OrderDetail vo) throws Exception;

	/** 메인페이지부터 전달된 주문페이지 내용을 가져온다. */
	public List<OrderInfoVO> directOrderInfo(@Param("pro_num") Integer pro_num, @Param("ord_amount") Integer ord_amount) throws Exception;
}
