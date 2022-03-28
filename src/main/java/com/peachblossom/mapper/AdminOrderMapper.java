package com.peachblossom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.OrderVO;

public interface AdminOrderMapper {
	
	public List<OrderVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void orderStateChange(@Param("ord_code") Integer ord_code, @Param("ord_state") String ord_state);
}
