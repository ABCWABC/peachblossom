package com.peachblossom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.MemberVO;
import com.peachblossom.domain.PageDTO;
import com.peachblossom.domain.ReviewVO;
import com.peachblossom.sevice.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
//@AllArgsConstructor
@RequestMapping("/review/*")
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	//리뷰리스트 출력
	@GetMapping("/productReview")
	public void product_review(@ModelAttribute("cri") Criteria cri,
								@RequestParam("pro_num") Integer pro_num, Model model) {
		
		log.info("productReview");
		
		cri.setAmount(2);
		
		int total = service.getTotalCount(pro_num);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("reviewListVO", service.getReviewListWithPaging(cri, pro_num));
	}
	
	//상품후기등록
	@ResponseBody
	@PostMapping("/productReviewWrite")
	public ResponseEntity<String> productReviewWrite(ReviewVO vo, HttpSession session){
		
		log.info("상품후기: " + vo);
		
		vo.setMb_id(((MemberVO) session.getAttribute("loginStatus")).getMb_id());
		
		ResponseEntity<String> entity = null;
		
		try {
			service.reviewInsert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//상품후기수정
	@ResponseBody
	@PostMapping("/productReviewEdit")
	public ResponseEntity<String> productReviewEdit(ReviewVO vo, HttpSession session){
		
		log.info("상품후기: " + vo);
		
		vo.setMb_id(((MemberVO) session.getAttribute("loginStatus")).getMb_id());
		
		ResponseEntity<String> entity = null;
		
		try {
			service.reviewEdit(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//상품후기삭제
	@ResponseBody
	@PostMapping("/productReviewDel")
	public ResponseEntity<String> productReviewDel(Integer rew_num){
		
		ResponseEntity<String> entity = null;
		
		try {
			service.reviewDel(rew_num);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
