package com.peachblossom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.OrderDetailInfo;
import com.peachblossom.domain.OrderVO;

public interface AdminOrderMapper {
	
	/** 관리자 주문페이지 리스트를 가져온다. - 일반주문목록 */
	public List<OrderVO> getListWithPaging(@Param("cri") Criteria cri, @Param("startDate") String startDate, @Param("endDate") String endDate) throws Exception;
	
	/** 관리자 주문페이지의 총 갯수를 계산한다. - 일반주문목록 */
	public int getTotalCount(@Param("cri") Criteria cri, @Param("startDate") String startDate, @Param("endDate") String endDate) throws Exception;
	
	/** 관리자 주문페이지 리스트를 가져온다. - 상태별주문목록 */
	public List<OrderVO> getOrderStateListWithPaging(@Param("cri") Criteria cri, @Param("ord_state") String ord_state) throws Exception;
	
	/** 관리자 주문페이지의 총 갯수를 계산한다. - 상태별주문목록 */
	public int getOrderStateTotalCount(@Param("cri") Criteria cri, @Param("ord_state") String ord_state) throws Exception;
	
	/** 주문자의 주문상태를 변경한다. */
	public void orderStateChange(@Param("ord_code") Integer ord_code, @Param("ord_state") String ord_state) throws Exception;
	
	/** 주문 내역을 삭제한다. - 일반주문목록 */
	public void ordDelete(Integer ord_code) throws Exception;
	
	/** 주문 내역을 삭제한다. - 상세주문목록 */
	public void ordDetailDelete(Integer ord_code) throws Exception;
	
	/** 주문별 상세주문목록을 가져온다. */
	public List<OrderDetailInfo> ordDetailInfo(Integer ord_code) throws Exception;
	
	/** 주문별 상세주문목록을 삭제한다. */
	public void ordDetailListDelete(@Param("ord_code") Integer ord_code, @Param("pro_num") Integer pro_num) throws Exception;
	
	/** 주문상태별 건수를 계산한다. */
	public int getOrderStateCount(String ord_state) throws Exception;
	
}
