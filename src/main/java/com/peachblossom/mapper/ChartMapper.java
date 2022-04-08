package com.peachblossom.mapper;

import java.util.List;

import com.peachblossom.domain.ChartVO;

public interface ChartMapper {
	
	public List<ChartVO> primaryChart();
	public List<ChartVO> secondaryChart();
	public List<ChartVO> salesByYearChart();

	public List<ChartVO> primaryChartByMonth(String ord_date);
}
