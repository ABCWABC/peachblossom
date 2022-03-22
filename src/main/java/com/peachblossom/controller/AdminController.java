package com.peachblossom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peachblossom.domain.AdminVO;
import com.peachblossom.sevice.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	private AdminService service;
	
	private PasswordEncoder cryptPassEnc;
	
	//관리자로그인 폼
	@GetMapping("/logon")
	public void adLoginForm() {
	}
	
	//관리자로그인 처리
	@PostMapping("/logon")
	public String adLoginOk(String ad_userid, String ad_userpw, HttpSession session, RedirectAttributes rttr) {
		
		log.info("관리자아이디: " + ad_userid);
		log.info("관리자비번 :" + ad_userpw);
		
		String redirectUrl = "";
		AdminVO vo = service.adminLogin(ad_userid);
		
		if(!StringUtils.isEmpty(vo)) {
			if(cryptPassEnc.matches(ad_userpw, vo.getAd_userpw())) {
				session.setAttribute("adminStatus", vo);
				rttr.addFlashAttribute("msg","logonSuccess");
				redirectUrl = "/admin/main";
			}else {
				rttr.addFlashAttribute("msg","failPw");
				redirectUrl = "/admin/logon";
			}
		}else {
			rttr.addFlashAttribute("msg", "failId");
			redirectUrl = "/admin/logon";
		}
		
		return "redirect:"+redirectUrl;
	}
	
	//관리자메인페이지 폼
	@GetMapping("/main")
	public void main() {
	}
	
	//관리자계정 추가 폼
	@GetMapping("/adminRegister")
	public void adminRegister() {
	}
	
	//관리자계정 추가 처리
	@PostMapping("/adminRegister")
	public String adminRegister(AdminVO vo, RedirectAttributes rttr) {
		
		vo.setAd_userpw(cryptPassEnc.encode(vo.getAd_userpw()));
		
		int result = service.adminRegister(vo);
		
		if(result == 1) {
			rttr.addFlashAttribute("msg", "success");
		}else {
			rttr.addFlashAttribute("msg", "fail");
		}
		
		return "redirect:/admin/logon";
	}
}
