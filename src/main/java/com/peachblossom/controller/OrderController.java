package com.peachblossom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peachblossom.domain.MemberVO;
import com.peachblossom.sevice.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/order/*")
@Controller
public class OrderController {
	
	private OrderService oService;
	
	@RequestMapping("/orderInfo")
	public void orderInfo(HttpSession session, Model model) {
		
		String mb_id = ((MemberVO) session.getAttribute("loginStatus")).getMb_id();
		
		model.addAttribute("orderInfo", oService.orderInfo(mb_id));
	}

}
