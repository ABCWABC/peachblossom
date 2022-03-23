package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.OrderDetailList;
import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.domain.OrderVO;

public interface OrderService {
	
	public List<OrderInfoVO> orderInfo(String mb_id);
	
	public void orderInsert(OrderVO vo, OrderDetailList vo2);
}
