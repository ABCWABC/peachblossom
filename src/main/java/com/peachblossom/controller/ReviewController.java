package com.peachblossom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/review/*")
@Controller
public class ReviewController {
	
	@GetMapping("/productReview")
	public void product_review(@RequestParam("pro_num") Integer pro_num) {
		
		log.info("productReview");
	}

}
