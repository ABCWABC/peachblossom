package com.peachblossom.sevice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.OrderVO;
import com.peachblossom.mapper.AdminOrderMapper;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	
	private AdminOrderMapper oMapper;

	@Override
	public List<OrderVO> getListWithPaging(Criteria cri) {
		return oMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return oMapper.getTotalCount(cri);
	}

	@Override
	public void orderStateChange(Integer ord_code, String ord_state) {
		oMapper.orderStateChange(ord_code, ord_state);
	}

}
