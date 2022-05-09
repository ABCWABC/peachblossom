package com.peachblossom.controller;

import javax.servlet.http.HttpSession;

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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * @Class Name : ReviewController.java
 * @Description : 쇼핑몰 사용자 -리뷰페이지- 작업을 위한 Controller
 * @Modification Information
 * @
 * @ 수정일              수정자          수정내용
 * @ ----------  --------  ---------------------------
 *   2022.03.11  이유미          최초 생성
 *   2022.03.18  이유미          디자인 수정
 *
 *  @author 이유미
 *  @since 2022.03.11
 *  @version 1.0
 *  @see
 *
 */

@Log4j
@AllArgsConstructor
@RequestMapping("/review/*")
@Controller
public class ReviewController {
	
	private ReviewService service;
	
	//리뷰리스트 출력
	@GetMapping("/productReview")
	public void product_review(@ModelAttribute("cri") Criteria cri,
								@RequestParam("pro_num") Integer pro_num, Model model) throws Exception {
		
		cri.setAmount(2);
		
		int total = service.getTotalCount(pro_num);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("reviewListVO", service.getReviewListWithPaging(cri, pro_num));
	}
	
	//상품후기등록
	@ResponseBody
	@PostMapping("/productReviewWrite")
	public ResponseEntity<String> productReviewWrite(ReviewVO vo, HttpSession session) throws Exception {
		
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
	public ResponseEntity<String> productReviewEdit(ReviewVO vo, HttpSession session) throws Exception {
		
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
	public ResponseEntity<String> productReviewDel(Integer rew_num) throws Exception {
		
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
