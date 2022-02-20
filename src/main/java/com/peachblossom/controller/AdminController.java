package com.peachblossom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@GetMapping("/logon")
	public void adLoginForm() {
		
	}
	
	@PostMapping("/logon")
	public String adLoginOk() {
		
		return "redirect://admin/main";
	}
	
	@GetMapping("/main")
	public void main() {
		
	}

}
