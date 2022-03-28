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
import org.springframework.web.bind.annotation.RequestParam;
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
	public void orderInfo(String type, @RequestParam(value = "pro_num", required = false) Integer pro_num, @RequestParam(value = "pro_amount", required = false) Integer pro_amount, HttpSession session, Model model) {
		
		String mb_id = ((MemberVO) session.getAttribute("loginStatus")).getMb_id();
		
		List<OrderInfoVO> list = null;
		
		if(type.equals("direct")) {
			// 상품1개
			list = oService.directOrderInfo(pro_num, pro_amount);  // 1)메인에서 바로구매 2)상품상세 바로구매
			(list.get(0)).setCart_amount(pro_amount); // 수량변경.
		}else if(type.equals("cart_order")) {
			list = oService.orderInfo(mb_id);      // 장바구니에서 구매
		}
				
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
	
	@PostMapping("/orderAction") // 클라이언트에서 보낸 데이타가 메서드의 파라미터에 타입또는 값이 제공되지 않아서 에러발생
	public String orderAction(OrderVO order, OrderDetailList orderDetail, HttpSession session) {
		
		order.setMb_id( ( (MemberVO)session.getAttribute("loginStatus") ).getMb_id() );
		
		log.info("주문정보: " + order);
		log.info("주문상세정보: " + orderDetail);
		
		oService.orderInsert(order, orderDetail);
		
		return "redirect:/";
	}

}
