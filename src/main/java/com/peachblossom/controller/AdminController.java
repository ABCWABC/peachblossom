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

/**
 * @Class Name : AdminController.java
 * @Description : 쇼핑몰 관리자 -로그인,계정- 작업을 위한 Controller
 * @Modification Information
 * @
 * @ 수정일              수정자          수정내용
 * @ ----------  --------  ---------------------------
 *   2022.02.22  이유미          최초 생성
 *   2022.03.11  이유미          관리자 로그인 및 계정 추가
 *
 *  @author 이유미
 *  @since 2022.02.22
 *  @version 1.0
 *  @see
 *
 */

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	private AdminService service;
	
	private PasswordEncoder cryptPassEnc;
	
	//관리자로그인 폼
	@GetMapping("/logon")
	public void adLoginForm() throws Exception {
	}
	
	//관리자로그인 처리폼
	@PostMapping("/logon")
	public String adLoginOk(String ad_userid, String ad_userpw, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		log.info("관리자아이디: " + ad_userid + ", 관리자비번 :" + ad_userpw);
		
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
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "/admin/logon";
	}
	
	//메인페이지
	@GetMapping("/main")
	public void main() throws Exception {
	}
	
	//관리자계정 추가 폼
	@GetMapping("/adminRegister")
	public void adminRegister() throws Exception {
	}
	
	//관리자계정 추가 처리
	@PostMapping("/adminRegister")
	public String adminRegister(AdminVO vo, RedirectAttributes rttr) throws Exception {
		
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
