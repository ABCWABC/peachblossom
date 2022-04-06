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

}
