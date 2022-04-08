package com.peachblossom.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.peachblossom.domain.ChartVO;
import com.peachblossom.sevice.ChartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/chart/*")
@Controller
public class ChartController {
	
	private ChartService service;
	
	//전체 통계차트 페이지
	@GetMapping("/overall")
	public ModelAndView overallChart() throws Exception {
		
		// 통계차트 데이타
		/*
		 2차원 배열구조
		  [
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]
		 */
		
		ModelAndView mv = new ModelAndView();
		
		
		/*-------------------------1차 카테고리 차트작업------------------------------*/
		List<ChartVO> primary_list = service.primaryChart();
		
		String primaryData = "[['1차 카테고리', '매출'],";
		
		int i = 0;
		for(ChartVO vo : primary_list) {
			primaryData += "['" + vo.getCate_name() + "'," + vo.getSales() + "]";
			i++;
			// 마지막 데이타 작업시 콤마(,)는 추가하지않는다.
			if(i < primary_list.size()) primaryData += ",";	
		}

		primaryData += "]";
		
		/*---------------------------2차 카테고리 차트작업----------------------------*/
		
		List<ChartVO> second_list = service.secondaryChart();
		
		String secondData = "[['2차 카테고리', '매출'],";
		
		int j = 0;
		for(ChartVO vo : second_list) {
			secondData += "['" + vo.getCate_name() + "'," + vo.getSales() + "]";
			j++;
			// 마지막 데이타 작업시 콤마(,)는 추가하지않는다.
			if(j < second_list.size()) secondData += ",";	
		}

		secondData += "]";
		
		/*---------------------------년도별 매출 차트작업----------------------------*/
		
		List<ChartVO> salesByYearList = service.salesByYearChart();
		
		String salesYearData = "[['연도', '총매출'],";
		
		int k = 0;
		for(ChartVO vo : salesByYearList) {
			salesYearData += "['" + vo.getYear() + "'," + vo.getTotalprice() + "]";
			k++;
			// 마지막 데이타 작업시 콤마(,)는 추가하지않는다.
			if(k < salesByYearList.size()) salesYearData += ",";	
		}

		salesYearData += "]";
				
		// mv.addObject("Model이름", 데이타);
		mv.addObject("prime_chart", primaryData);
		mv.addObject("second_chart", secondData);
		mv.addObject("salesYear_chart", salesYearData);
		// jsp파일명
		mv.setViewName("/admin/chart/overall");
		
		return mv;
	}
	
	@GetMapping("/monthlyOrder")
	public ModelAndView monthlyOrderChart(@RequestParam(value = "ord_date", required = false) String ord_date) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		log.info(ord_date);
		//Timestamp currentDate = new Timestamp(System.currentTimeMillis());
		
		if(StringUtils.isEmpty(ord_date)) {
			Date now = new Date();
					
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM");
			ord_date = format.format(now);  // 2022/04
		}
		
		List<ChartVO> month_list = service.primaryChartByMonth(ord_date);
		
		String monthData = "[['1차 카테고리', '년월매출'],";
		
		int i = 0;
		for(ChartVO vo : month_list) {
			monthData += "['" + vo.getCate_name() + "'," + vo.getSales() + "]";
			i++;
			// 마지막 데이타 작업시 콤마(,)는 추가하지않는다.
			if(i < month_list.size()) monthData += ",";	
		}

		monthData += "]";
		
		mv.addObject("prime_month_chart", monthData);
		mv.setViewName("/admin/chart/monthlyOrder");
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value = "/monthlyOrder2", produces = "application/text; charset=utf8")
	public ResponseEntity<String> monthlyOrderChart2(@RequestParam(value = "ord_date", required = false) String ord_date) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		log.info(ord_date);
		//Timestamp currentDate = new Timestamp(System.currentTimeMillis());
		
		if(StringUtils.isEmpty(ord_date)) {
			Date now = new Date();
					
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM");
			ord_date = format.format(now);  // 2022/04
		}
		
		List<ChartVO> month_list = service.primaryChartByMonth(ord_date);
		
		String monthData = "";
		
		if(month_list.size() != 0) monthData = "[['1차 카테고리', '년월매출'],";

		int i = 0;
		for(ChartVO vo : month_list) {
			monthData += "['" + vo.getCate_name() + "'," + vo.getSales() + "]";
			i++;
			// 마지막 데이타 작업시 콤마(,)는 추가하지않는다.
			if(i < month_list.size()) monthData += ",";	
		}

		monthData += "]";
		
		log.info(monthData);
		
		
		entity = new ResponseEntity<String>(monthData, HttpStatus.OK);
		
		return entity;
	}
}
