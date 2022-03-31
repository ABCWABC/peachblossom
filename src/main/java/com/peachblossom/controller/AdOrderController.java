package com.peachblossom.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.OrderVO;
import com.peachblossom.domain.PageDTO;
import com.peachblossom.sevice.AdminOrderService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RequestMapping("/admin/order/*")
@Controller
public class AdOrderController {
	
	private AdminOrderService oService;

	//관리자 주문페이지 출력
	@GetMapping("/orderList")
	public void orderList(Criteria cri, Model model) {
		
		cri.setAmount(2);
		
		List<OrderVO> list = oService.getListWithPaging(cri);
		
		int total = oService.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("orderList", list);
	}
	
	//상태일괄변경, 개별주문상태변경
	@ResponseBody  
	@PostMapping("/orderStateAll")
	public ResponseEntity<String> checkDelete(@RequestParam("ord_codeArr[]") List<Integer> ord_codeArr, 
												@RequestParam("ord_StateArr[]") List<String> ord_StateArr) {
		
		ResponseEntity<String> entity = null;
		
		try {
			for(int i=0; i < ord_codeArr.size(); i++) {
				oService.orderStateChange(ord_codeArr.get(i), ord_StateArr.get(i));
			}
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//주문삭제(주문테이블, 주문상세테이블)
	@ResponseBody
	@PostMapping("/checkDelete")
	public ResponseEntity<String> checkDelete(@RequestParam("ord_codeArr[]") List<Integer> ord_codeArr){
		
		ResponseEntity<String> entity = null;
		
		try {
			for(int i=0; i<ord_codeArr.size(); i++) {
				oService.ordDelete(ord_codeArr.get(i));
			}
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//주문상세 폼
	@GetMapping("/detailInfo")
	public void detailInfo(Integer ord_code, Model model) {
		model.addAttribute("oDetailList", oService.ordDetailInfo(ord_code));
	}
}
