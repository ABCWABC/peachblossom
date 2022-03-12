package com.peachblossom.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachblossom.domain.CartListVO;
import com.peachblossom.domain.CartVO;
import com.peachblossom.domain.MemberVO;
import com.peachblossom.sevice.CartService;
import com.peachblossom.util.UploadFileUtils;

@RequestMapping("/cart/*")
@Controller
public class CartController {
	
	@Resource(name = "uploadFolder")
	String uploadFolder;

	@Inject
	private CartService service;
	
	//장바구니 추가 (로그인 인증된 경우만)
	@ResponseBody
	@PostMapping("/cartAdd")
	public ResponseEntity<String> cart_add(Integer pro_num, int cart_amount, HttpSession session) { // 키로 넘어오는것은 Integer , 아닌것은 int
		
		ResponseEntity<String> entity = null;
		
		CartVO vo = new CartVO();
		vo.setPro_num(pro_num);
		vo.setCart_amount(cart_amount);
		vo.setMb_id(((MemberVO)session.getAttribute("loginStatus")).getMb_id());
		
		try {
			service.cartAdd(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//장바구니 리스트 출력 (로그인 인증된 경우만)
	@GetMapping("/cartList")
	public void cart_list(HttpSession session, Model model) {
		
		String mb_id = ((MemberVO)session.getAttribute("loginStatus")).getMb_id();
		List<CartListVO> list = service.cartList(mb_id);
		
		for(int i=0; i<list.size(); i++) {
			CartListVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		model.addAttribute("cartList", list);
	}
	
	//장바구니 리스트의 썸네일 이미지 출력
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName){
		
		ResponseEntity<byte[]> entity = null;
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName);
		return entity;
	}
	
	//장바구니 선택 삭제
	@ResponseBody  
	@PostMapping("/checkDelete")
	public ResponseEntity<String> checkDelete(@RequestParam("cart_codeArr[]") List<Integer> cart_codeArr){
		
		ResponseEntity<String> entity = null;
		
		try {
			for(int i=0; i<cart_codeArr.size(); i++) {
				service.cartDel(cart_codeArr.get(i));
			}
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//장바구니 전체 삭제
	@GetMapping("/cartAllDelete")
	public String cartAllDelete(HttpSession session) {
		
		String mb_id = ((MemberVO)session.getAttribute("loginStatus")).getMb_id();
		service.cartAllDel(mb_id);
		
		return "redirect:/cart/cartList";
	}
}
