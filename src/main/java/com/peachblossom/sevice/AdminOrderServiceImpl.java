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

	/** 관리자 주문페이지 리스트를 가져온다. - 일반주문목록 */
	@Override
	public List<OrderVO> getListWithPaging(Criteria cri, String startDate, String endDate) throws Exception {
		return oMapper.getListWithPaging(cri, startDate, endDate);
	}

	/** 관리자 주문페이지의 총 갯수를 계산한다. - 일반주문목록 */
	@Override
	public int getTotalCount(Criteria cri, String startDate, String endDate) throws Exception {
		return oMapper.getTotalCount(cri, startDate, endDate);
	}
	
	/** 관리자 주문페이지 리스트를 가져온다. - 상태별주문목록 */
	@Override
	public List<OrderVO> getOrderStateListWithPaging(Criteria cri, String ord_state) throws Exception {
		return oMapper.getOrderStateListWithPaging(cri, ord_state);
	}
	
	/** 관리자 주문페이지의 총 갯수를 계산한다. - 상태별주문목록 */
	@Override
	public int getOrderStateTotalCount(Criteria cri, String ord_state) throws Exception {
		return oMapper.getOrderStateTotalCount(cri, ord_state);
	}

	/** 주문자의 주문상태를 변경한다. */
	@Override
	public void orderStateChange(Integer ord_code, String ord_state) throws Exception {
		oMapper.orderStateChange(ord_code, ord_state);
	}

	/** 주문 내역을 삭제한다. - 일반주문목록 */
	@Transactional
	@Override
	public void ordDelete(Integer ord_code) throws Exception {
		oMapper.ordDetailDelete(ord_code);
		oMapper.ordDelete(ord_code);
	}
	
	/** 주문 내역을 삭제한다. - 상세주문목록 */
	@Override
	public void ordDetailDelete(Integer ord_code, Integer pro_num) throws Exception {
		oMapper.ordDetailListDelete(ord_code, pro_num);
	}

	/** 주문별 상세주문목록을 가져온다. */
	@Override
	public List<OrderDetailInfo> ordDetailInfo(Integer ord_code) throws Exception {
		return oMapper.ordDetailInfo(ord_code);
	}

	/** 주문상태별 건수를 계산한다. */
	@Override
	public int getOrderStateCount(String ord_state) throws Exception {
		return oMapper.getOrderStateCount(ord_state);
	}

}
