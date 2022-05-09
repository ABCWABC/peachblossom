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

	/** 1차 카테고리 차트작업한다. */
	@Override
	public List<ChartVO> primaryChart() throws Exception {
		return chartMapper.primaryChart();
	}

	/** 2차 카테고리 차트작업한다. */
	@Override
	public List<ChartVO> secondaryChart() throws Exception {
		return chartMapper.secondaryChart();
	}

	/** 년도별 매출 차트작업한다. */
	@Override
	public List<ChartVO> salesByYearChart() throws Exception {
		return chartMapper.salesByYearChart();
	}

	/** 월별 매출 차트작업한다. */
	@Override
	public List<ChartVO> primaryChartByMonth(String ord_date) throws Exception {
		return chartMapper.primaryChartByMonth(ord_date);
	}

}
