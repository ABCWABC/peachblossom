package com.peachblossom.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.peachblossom.domain.ChartVO;
import com.peachblossom.mapper.ChartMapper;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Inject
	private ChartMapper chartMapper;

	@Override
	public List<ChartVO> primaryChart() {
		return chartMapper.primaryChart();
	}

	@Override
	public List<ChartVO> secondaryChart() {
		return chartMapper.secondaryChart();
	}

	@Override
	public List<ChartVO> salesByYearChart() {
		return chartMapper.salesByYearChart();
	}

	@Override
	public List<ChartVO> primaryChartByMonth(String ord_date) {
		return chartMapper.primaryChartByMonth(ord_date);
	}

}
