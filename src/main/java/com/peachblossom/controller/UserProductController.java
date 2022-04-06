package com.peachblossom.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.PageDTO;
import com.peachblossom.domain.ProductVO;
import com.peachblossom.sevice.UserProductService;
import com.peachblossom.util.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/product/*")
@Controller
public class UserProductController {
	
	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	private UserProductService service;
	
	//2차카테고리 출력
	@ResponseBody
	@GetMapping(value = "/subCategory/{mainCategoryCode}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("mainCategoryCode") Integer cate_code){
		
		log.info(cate_code);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		entity = new ResponseEntity<List<CategoryVO>>(service.subCategory(cate_code), HttpStatus.OK);
		return entity;
	}
	
	//메인에서 BEST , NEW 상품리스트
	@GetMapping("/productMain")
	public void productMain(Model model) {
		
		List<ProductVO> newList = service.productNewList();
		for(int i=0; i<newList.size(); i++) {
			ProductVO vo = newList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		List<ProductVO> bestList = service.productBestList();
		for(int i=0; i<bestList.size(); i++) {
			ProductVO vo = bestList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		model.addAttribute("newProductList", newList);
		model.addAttribute("bestProductList", bestList);
		
	}

	//2차카테고리 - 각 상품리스트
	@GetMapping("/productList")
	public void productList(@ModelAttribute("cri") Criteria cri, @ModelAttribute("cate_code") Integer cate_code, Model model) {
		
		cri.setAmount(8);
		
		List<ProductVO> list = service.getListWithPaging(cate_code, cri);
		
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		int total = service.getTotalCount(cate_code);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("productList", list);
	}
	
	//상품상세페이지 출력
	@GetMapping("/productDetail")
	public void productDetail(@RequestParam(value = "type", defaultValue = "Y") String type, @ModelAttribute("cri") Criteria cri
								, @ModelAttribute("cate_code") Integer cate_code, @RequestParam("pro_num") Integer pro_num, Model model) {
		
		ProductVO vo = service.productDetail(pro_num);
		vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		
		model.addAttribute("productVO", vo);
		model.addAttribute("type", type);
	}
	
	//상품리스트의 이미지출력(썸네일)
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName);
		
		return entity;
	}
	
}
