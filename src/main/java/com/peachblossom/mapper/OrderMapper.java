package com.peachblossom.mapper;

import java.util.List;

import com.peachblossom.domain.OrderDetail;
import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.domain.OrderVO;

public interface OrderMapper {
	
	public List<OrderInfoVO> orderInfo(String mb_id);
	
	public void orderInsert(OrderVO vo);
	
	public void orderDetailInsert(OrderDetail vo);

}
