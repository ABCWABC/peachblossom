package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.ChartVO;

public interface ChartService {
	
	/** 1차 카테고리 차트작업한다. */
	public List<ChartVO> primaryChart() throws Exception;
	
	/** 2차 카테고리 차트작업한다. */
	public List<ChartVO> secondaryChart() throws Exception;
	
	/** 년도별 매출 차트작업한다. */
	public List<ChartVO> salesByYearChart() throws Exception;
	
	/** 월별 매출 차트작업한다. */
	public List<ChartVO> primaryChartByMonth(String ord_date) throws Exception;

}
