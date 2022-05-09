package com.peachblossom.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.peachblossom.sevice.UserProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * @Class Name : ChartController.java
 * @Description : 쇼핑몰 사용자 -카테고리- 작업을 위한 Controller
 * @Modification Information
 * @
 * @ 수정일              수정자          수정내용
 * @ ----------  --------  ---------------------------
 *   2022.03.02  이유미          최초 생성
 *
 *  @author 이유미
 *  @since 2022.03.02
 *  @version 1.0
 *  @see
 *
 */

@Log4j
@AllArgsConstructor
@ControllerAdvice(basePackages = {"com.peachblossom.controller"})
public class GlobalControllerAdvice {
	
	private UserProductService service;

	@ModelAttribute
	public void commonCategoryData(Model model) throws Exception {
		
		log.info("model:" + model);
		
		model.addAttribute("userCategory", service.mainCategory());
	}
}
