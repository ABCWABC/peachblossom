package com.peachblossom.controller;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peachblossom.domain.EmailDTO;
import com.peachblossom.domain.MemberVO;
import com.peachblossom.sevice.MemberService;
import com.peachblossom.sevice.TestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Inject
	private PasswordEncoder cryptPassEnc;
	
	@Inject
	private MemberService service;
	
	@Inject
	private JavaMailSender mailSender;
	
	// 주요기능 : 회원기능
	
	
	//회원가입 폼
	@GetMapping("/join")
	public void join() {
	}
	
	//회원가입 저장
	@PostMapping("/join")
	public String joinOk(MemberVO vo, RedirectAttributes rttr) throws Exception{
		
		vo.setMb_password(cryptPassEnc.encode(vo.getMb_password())); //비밀번호 암호화
		
		log.info("회원정보출력" + vo);
		
		service.join(vo);
		
		return "redirect:/member/login";
	}
	
	//아이디 중복체크
	@ResponseBody
	@GetMapping("/checkID")
	public ResponseEntity<String> checkID(@RequestParam("mb_id") String mb_id) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		result = StringUtils.isEmpty(service.checkID(mb_id)) ? "Y" : "N";
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	//메일인증요청
	@ResponseBody
	@GetMapping("/sentMailAuth")
	public ResponseEntity<String> sendMailAuth(@RequestParam("mb_email") String mb_email, HttpSession session){
		
		ResponseEntity<String> entity = null;
		String authCode = makeAuthCode();
		
		session.setAttribute("authCode", authCode); //인증코드를 세션에 임시저장
		
		EmailDTO dto = new EmailDTO("Peach Blossom", "leeyumi0713@gmail.com", mb_email, "가입인증메일", authCode);
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			
			message.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			message.addRecipient(RecipientType.TO, new InternetAddress(mb_email));
			message.setSubject(dto.getSubject(), "utf-8");
			message.setText(dto.getMessage(), "utf-8");
			
			mailSender.send(message);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	
	//메일인증요청 확인
	@ResponseBody
	@GetMapping("/mailAuthConfirm")
	public ResponseEntity<String> MailAuthConfirm(@RequestParam("uAuthCode") String uAuthCode, HttpSession session){
		
		ResponseEntity<String> entity = null;
		String authCode = (String)session.getAttribute("authCode");
		
		if(authCode.equals(uAuthCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}
	
	
	//메일인증코드 생성 및 임시비밀번호 생성
	private String makeAuthCode() {
		
		String authCode = "";
		
		for(int i=0; i<6; i++) {
			authCode += String.valueOf((int) (Math.random()*9 +1) );
		}
		
		return authCode;
	}
	
	//회원수정 폼 및 마이페이지 폼 
	@GetMapping(value = {"/modify", "/mypage"})
	public void modify(HttpSession session, Model model) {
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String mb_id = vo.getMb_id();
		
		model.addAttribute(service.login(mb_id));
	}
	
	//회원수정 저장
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String redirectURL = "";
		vo.setMb_accept_e(!StringUtils.isEmpty(vo.getMb_accept_e()) ? "Y" : "N");
		
		log.info("회원의 수정한 정보:" + vo);
		
		MemberVO session_vo = (MemberVO)session.getAttribute("loginStatus");
		
		if(cryptPassEnc.matches(vo.getMb_password(), session_vo.getMb_password())) {
			
			service.modify(vo);
			redirectURL = "/";
			rttr.addFlashAttribute("msg", "modifyOk"); // main.jsp 에서 msg 참조
			
		}else {
			redirectURL = "/member/modify";
			rttr.addFlashAttribute("msg", "modifyFail"); // modify.jsp 에서 msg 참조
		}
		
		return "redirect:" + redirectURL;
	}
	
	//회원삭제
	@ResponseBody
	@PostMapping("/regDelete")
	public ResponseEntity<String> regDelete(@RequestParam("mb_password") String mb_password, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String mb_id = vo.getMb_id();
		
		entity = new ResponseEntity<String>(String.valueOf(service.regDelete(mb_id, cryptPassEnc, mb_password)), HttpStatus.OK);
		
		return entity;
	}
	
	//로그인 폼
	@GetMapping("/login")
	public void login() {
	}

	//로그인 처리
	@ResponseBody
	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestParam("mb_id") String mb_id, @RequestParam("mb_password") String mb_password, HttpSession session) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		MemberVO vo = service.login(mb_id);
		
		if(vo == null) {
			result = "idFail";
		}else {
			if(cryptPassEnc.matches(mb_password, vo.getMb_password())) {
				result = "success";
				session.setAttribute("loginStatus", vo);
			}else {
				result = "pwFail";
			}
		}
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	//로그아웃처리
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	//비밀번호찾기 폼
	@GetMapping("/searchPw")
	public void searchPwReq() {
	}
	
	//비밀번호찾기 처리
	@ResponseBody
	@PostMapping("/searchPw")
	public ResponseEntity<String> searchPwAction(@RequestParam("mb_email") String mb_email){
		
		ResponseEntity<String> entity = null;
		
		if(!StringUtils.isEmpty(service.searchPwByEmail(mb_email))) {
			
			String tempPw = makeAuthCode();
			EmailDTO dto = new EmailDTO("Peach Blossom", "leeyumi0713@gmail.com", mb_email, "가입인증메일", tempPw);
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				message.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
				message.addRecipient(RecipientType.TO, new InternetAddress(mb_email));
				message.setSubject(dto.getSubject(), "utf-8");
				message.setText(dto.getMessage(), "utf-8");
				
				mailSender.send(message);
				
				String encryptPw = cryptPassEnc.encode(tempPw);
				service.changePw(mb_email, encryptPw);
				
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
			} catch(Exception e) {
				
				e.printStackTrace();
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			}
			
		}else {
			entity = new ResponseEntity<String>("noMail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//비밀번호 변경하기
	@ResponseBody
	@PostMapping("/chagePw")
	public ResponseEntity<String> changePw(@RequestParam("cur_mb_password") String cur_mb_password,
											@RequestParam("change_mb_password") String change_mb_password, HttpSession session){
		
		ResponseEntity<String> entity = null;
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		String mb_id = vo.getMb_id();
		
		log.info("파라미터" + mb_id);
		log.info("파라미터" + cur_mb_password);
		log.info("파라미터" + change_mb_password);
		
		String result = service.currentPwConfirm(mb_id, cryptPassEnc, cur_mb_password, cryptPassEnc.encode(change_mb_password));
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	//아이디및비밀번호 찾기
	@GetMapping("/searchIDPW")
	public void searchIDPW() {
		
	}
	
	
	

}
