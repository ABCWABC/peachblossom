package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.OrderInfoVO;

public interface OrderService {
	
	public List<OrderInfoVO> orderInfo(String mb_id);

}
