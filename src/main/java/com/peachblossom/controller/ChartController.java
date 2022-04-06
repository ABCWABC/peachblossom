package com.peachblossom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/chart/*")
@Controller
public class ChartController {
	
	//전체 통계차트 페이지
	@GetMapping("/overall")
	public ModelAndView overallChart() throws Exception {
		
		return null;
	}

}
