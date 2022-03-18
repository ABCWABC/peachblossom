package com.peachblossom.mapper;

import java.util.List;

import com.peachblossom.domain.OrderInfoVO;

public interface OrderMapper {
	
	public List<OrderInfoVO> orderInfo(String mb_id);

}
