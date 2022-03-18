package com.peachblossom.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderMapper mapper;

	@Override
	public List<OrderInfoVO> orderInfo(String mb_id) {
		return mapper.orderInfo(mb_id);
	}

}
