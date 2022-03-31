package com.peachblossom.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.peachblossom.sevice.UserProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@ControllerAdvice(basePackages = {"com.peachblossom.controller"})
public class GlobalControllerAdvice {
	
	private UserProductService service;

	@ModelAttribute
	public void commonCategoryData(Model model) {
		
		log.info("model:" + model);
		
		model.addAttribute("userCategory", service.mainCategory());
	}
}
