package com.peachblossom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.OrderDetailInfo;
import com.peachblossom.domain.OrderVO;

public interface AdminOrderMapper {
	
	public List<OrderVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void orderStateChange(@Param("ord_code") Integer ord_code, @Param("ord_state") String ord_state);
	
	public void ordDelete(Integer ord_code);
	
	public void ordDetailDelete(Integer ord_code);
	
	public List<OrderDetailInfo> ordDetailInfo(Integer ord_code);
}
