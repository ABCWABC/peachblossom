package com.peachblossom.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peachblossom.domain.MemberVO;
import com.peachblossom.domain.OrderDetailList;
import com.peachblossom.domain.OrderInfoVO;
import com.peachblossom.domain.OrderVO;
import com.peachblossom.sevice.KakaoPayServiceImpl;
import com.peachblossom.sevice.OrderService;
import com.peachblossom.util.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * @Class Name : OrderController.java
 * @Description : 쇼핑몰 사용자 -주문페이지- 작업을 위한 Controller
 * @Modification Information
 * @
 * @ 수정일              수정자          수정내용
 * @ ----------  --------  ---------------------------
 *   2022.03.18  이유미          최초 생성
 *   2022.03.23  이유미          디자인 수정
 *
 *  @author 이유미
 *  @since 2022.03.18
 *  @version 1.0
 *  @see
 *
 */

@Log4j
@AllArgsConstructor
@RequestMapping("/order/*")
@Controller
public class OrderController {
	
	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	private OrderService oService;
	
	private KakaoPayServiceImpl kakaopayService;
	
	//주문내역
	@RequestMapping("/orderInfo")
	public void orderInfo(@RequestParam(value = "type", required = false, defaultValue = "cart_order") String type, 
							@RequestParam(value = "pro_num", required = false) Integer pro_num, 
							@RequestParam(value = "pro_amount", required = false) Integer pro_amount, HttpSession session, Model model) throws Exception {
		
		String mb_id = ((MemberVO) session.getAttribute("loginStatus")).getMb_id();
		
		List<OrderInfoVO> list = null;
		
		if(type.equals("direct")) {                                // 상품1개
			list = oService.directOrderInfo(pro_num, pro_amount);  // 1)메인에서 바로구매 2)상품상세 바로구매
			(list.get(0)).setCart_amount(pro_amount);              // 수량변경.
		}else if(type.equals("cart_order")) {
			list = oService.orderInfo(mb_id);                      // 장바구니에서 구매
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
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName);
		
		return entity;
	}
	
	@PostMapping("/orderAction") // 클라이언트에서 보낸 데이타가 메서드의 파라미터에 타입또는 값이 제공되지 않아서 에러발생
	public String orderAction(OrderVO order, OrderDetailList orderDetail, HttpSession session) throws Exception {
		
		order.setMb_id( ( (MemberVO)session.getAttribute("loginStatus") ).getMb_id() );
		
		log.info("주문정보: " + order);
		log.info("주문상세정보: " + orderDetail);
		
		oService.orderInsert(order, orderDetail);
		
		return "redirect:/";
	}
	
	@PostMapping("/orderActionKAKAO") // 클라이언트에서 보낸 데이타가 메서드의 파라미터에 타입또는 값이 제공되지 않아서 에러발생
	public String orderAction(OrderVO order, OrderDetailList orderDetail, HttpSession session,
								RedirectAttributes rttr) throws Exception {
		
		order.setMb_id( ( (MemberVO)session.getAttribute("loginStatus") ).getMb_id() );
		
		log.info("주문정보: " + order);
		log.info("주문상세정보: " + orderDetail);
		
		oService.orderInsert(order, orderDetail);
		
		String pro_name = String.format("주문번호: %d [상품 %d 건]", order.getOrd_code(), orderDetail.getOrderDetailList().size());
		
		rttr.addAttribute("ord_name", order.getOrd_name());
		rttr.addAttribute("ord_price", order.getOrd_price());
		rttr.addAttribute("ord_zipcode", order.getOrd_zipcode());
		rttr.addAttribute("pro_name", pro_name);
		
		return "redirect: /order/orderPayView";
	}

	@GetMapping("/orderPayView")
	public void orderPayView(@ModelAttribute("order") OrderVO order, @ModelAttribute("pro_name") String pro_name) throws Exception {
	}

}
