package com.peachblossom.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peachblossom.domain.OrderDetailList;
import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.domain.OrderVO;
import com.peachblossom.mapper.CartMapper;
import com.peachblossom.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderMapper mapper;
	
	@Inject
	private CartMapper cartMapper;

	@Override
	public List<OrderInfoVO> orderInfo(String mb_id) {
		return mapper.orderInfo(mb_id);
	}

	@Transactional
	@Override
	public void orderInsert(OrderVO order, OrderDetailList orderDetail) {
		mapper.orderInsert(order);
		
		Integer ord_code = order.getOrd_code();
		String mb_id = order.getMb_id();
		
		orderDetail.getOrderDetailList().forEach(oDetail -> {
			oDetail.setOrd_code(ord_code);
			mapper.orderDetailInsert(oDetail);
		});
		
		cartMapper.cartAllDel(mb_id);
	}

	@Override
	public List<OrderInfoVO> directOrderInfo(Integer pro_num, Integer ord_amount) {
		return mapper.directOrderInfo(pro_num, ord_amount);
	}
	
}
