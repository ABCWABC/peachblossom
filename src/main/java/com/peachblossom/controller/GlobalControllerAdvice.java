package com.peachblossom.controller;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.peachblossom.sevice.UserProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@ControllerAdvice(basePackages = {"com.peachblossom.controller"})
public class GlobalControllerAdvice {
	
	@Inject
	private UserProductService service;

	@ModelAttribute
	public void commonCategoryData(Model model) {
		model.addAttribute("userCategory", service.mainCategory());
	}
}
