package com.peachblossom.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachblossom.domain.MemberVO;
import com.peachblossom.domain.OrderDetailList;
import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.domain.OrderVO;
import com.peachblossom.sevice.OrderService;
import com.peachblossom.util.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/order/*")
@Controller
public class OrderController {
	
	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	private OrderService oService;
	
	//주문내역
	@RequestMapping("/orderInfo")
	public void orderInfo(HttpSession session, Model model) {
		
		String mb_id = ((MemberVO) session.getAttribute("loginStatus")).getMb_id();
		
		List<OrderInfoVO> list = oService.orderInfo(mb_id);
		
		for(int i=0; i<list.size(); i++) {
			OrderInfoVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		} 
		
		model.addAttribute("orderInfo", list);
	}
	
	//상품리스트의 썸네일 이미지출력
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName);
		
		return entity;
	}
	
	@PostMapping("/orderAction")
	public String orderAction(OrderVO order, OrderDetailList orderDetail, HttpSession session) {
		
		order.setMb_id( ( (MemberVO)session.getAttribute("loginStatus") ).getMb_id() );
		
		log.info("주문정보: " + order);
		log.info("주문상세정보: " + orderDetail);
		
		oService.orderInsert(order, orderDetail);
		
		return "redirect:/";
	}

}
