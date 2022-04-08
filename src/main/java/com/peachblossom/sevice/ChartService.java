package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.ChartVO;

public interface ChartService {
	
	public List<ChartVO> primaryChart();
	public List<ChartVO> secondaryChart();
	public List<ChartVO> salesByYearChart();
	
	public List<ChartVO> primaryChartByMonth(String ord_date);

}
