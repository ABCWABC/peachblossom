package com.peachblossom.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.OrderDetailInfo;
import com.peachblossom.domain.OrderVO;
import com.peachblossom.mapper.AdminOrderMapper;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Inject
	private AdminOrderMapper oMapper;

	@Override
	public List<OrderVO> getListWithPaging(Criteria cri, String startDate, String endDate) {
		return oMapper.getListWithPaging(cri, startDate, endDate);
	}

	@Override
	public int getTotalCount(Criteria cri, String startDate, String endDate) {
		return oMapper.getTotalCount(cri, startDate, endDate);
	}

	@Override
	public void orderStateChange(Integer ord_code, String ord_state) {
		oMapper.orderStateChange(ord_code, ord_state);
	}

	@Transactional
	@Override
	public void ordDelete(Integer ord_code) {
		oMapper.ordDetailDelete(ord_code);
		oMapper.ordDelete(ord_code);
	}

	@Override
	public List<OrderDetailInfo> ordDetailInfo(Integer ord_code) {
		return oMapper.ordDetailInfo(ord_code);
	}

	@Override
	public void ordDetailDelete(Integer ord_code, Integer pro_num) {
		oMapper.ordDetailListDelete(ord_code, pro_num);
	}

	@Override
	public List<OrderVO> getOrderStateListWithPaging(Criteria cri, String ord_state) {
		return oMapper.getOrderStateListWithPaging(cri, ord_state);
	}

	@Override
	public int getOrderStateTotalCount(Criteria cri, String ord_state) {
		return oMapper.getOrderStateTotalCount(cri, ord_state);
	}

	@Override
	public int getOrderStateCount(String ord_state) {
		return oMapper.getOrderStateCount(ord_state);
	}
}
