package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.OrderDetailInfo;
import com.peachblossom.domain.OrderVO;

public interface AdminOrderService {
	
	public List<OrderVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void orderStateChange(Integer ord_code, String ord_state);
	
	public void ordDelete(Integer ord_code);
	
	public List<OrderDetailInfo> ordDetailInfo(Integer ord_code);
}
