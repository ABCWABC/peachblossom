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

	/** 장바구니페이지부터 전달된 주문페이지 내용을 가져온다. */
	@Override
	public List<OrderInfoVO> orderInfo(String mb_id) throws Exception {
		return mapper.orderInfo(mb_id);
	}

	/** 주문내역을 등록한다. */
	@Transactional
	@Override
	public void orderInsert(OrderVO order, OrderDetailList orderDetail) throws Exception {
		mapper.orderInsert(order);
		
		Integer ord_code = order.getOrd_code();
		String mb_id = order.getMb_id();
		
		orderDetail.getOrderDetailList().forEach(oDetail -> {
			oDetail.setOrd_code(ord_code);
			try {
				mapper.orderDetailInsert(oDetail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		
		cartMapper.cartAllDel(mb_id);
	}

	/** 메인페이지부터 전달된 주문페이지 내용을 가져온다. */
	@Override
	public List<OrderInfoVO> directOrderInfo(Integer pro_num, Integer ord_amount) throws Exception {
		return mapper.directOrderInfo(pro_num, ord_amount);
	}
	
}
