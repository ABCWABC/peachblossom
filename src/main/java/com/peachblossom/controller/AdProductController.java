package com.peachblossom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.PageDTO;
import com.peachblossom.domain.ProductVO;
import com.peachblossom.sevice.AdminProductService;
import com.peachblossom.util.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * @Class Name : AdProductController.java
 * @Description : 쇼핑몰 관리자 -상품등록,상품리스트- 작업을 위한 Controller
 * @Modification Information
 * @
 * @ 수정일              수정자          수정내용
 * @ ----------  --------  ---------------------------
 *   2022.02.25  이유미          최초 생성
 *   2022.03.02  이유미          관리자 상품등록,상품리스트확인 기능 추가
 *
 *  @author 이유미
 *  @since 2022.02.25
 *  @version 1.0
 *  @see
 *
 */

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/product/*")
@Controller
public class AdProductController {

	@Resource(name = "uploadFolder")
	String uploadFolder;              // d:\\dev\\upload *
	
	@Resource(name = "ckUploadFolder")
	String ckUploadFolder;              // d:\\dev\\upload *
	
	private AdminProductService service;
	
	// 상품등록폼 - 1차카테고리 정보 출력
	@GetMapping("/productInsert")
	public void product_insert(Model model) throws Exception {
		model.addAttribute("mainCategory", service.mainCategory());
	}
	
	// 상품등록폼 - 2차카테고리 정보 출력
	@ResponseBody
	@GetMapping(value = "/subCategory/{mainCategoryCode}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("mainCategoryCode") Integer cate_code) throws Exception {
		
		ResponseEntity<List<CategoryVO>> entity = null;
		entity = new ResponseEntity<List<CategoryVO>>(service.subCategory(cate_code), HttpStatus.OK);
		
		return entity;
	}
	
	//CKEditor 상품설명 이미지.
	@PostMapping("/editor/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam("upload") MultipartFile upload) throws Exception {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try { //D:\Dev\Program\Spring\workspace\peachblossom\src\main\webapp\resources
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			String uploadPath =  ckUploadFolder + "\\WEB-INF\\views\\admin\\product\\upload\\" + fileName;
//			String uploadPath = ckUploadFolder + fileName;
			
			log.info("업로드폴더 물리적경로: " + uploadPath);
			
			out = new FileOutputStream(new File(uploadPath)); // 0byte의 빈 파일생성
			out.write(bytes);
			out.flush();
			
			String callback = request.getParameter("CKEditorFuncNum");
			
			log.info(callback);
			
			printWriter = response.getWriter();
			String fileUrl = "/upload/" + fileName;
//			String fileUrl = "/product/upload/" + fileName;
			printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("
								+ callback
								+ ",'"
								+ fileUrl
								+ "','이미지를 업로드 하였습니다.'"
								+ ")</script>");
			printWriter.flush();
		
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}finally {
			try {
				if(out != null) out.close();
				if(printWriter != null) printWriter.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
	}
	
	//상품등록 저장
	@PostMapping("/productInsert")
	public String product_insert(ProductVO vo, RedirectAttributes rttr) throws Exception {
		
		log.info("상품정보" + vo);
		
		//1)파일업로드
		vo.setPro_img(UploadFileUtils.uploadFile(uploadFolder, vo.getUpload()));
		vo.setPro_uploadpath(UploadFileUtils.getFolder()); // 날짜폴더명

		//2)상품정보 저장
		service.product_insert(vo);
		
		rttr.addFlashAttribute("msg", "insertOk");
		
		return "redirect:/admin/product/productList";
	}
	
	//상품리스트
	@GetMapping("/productList")
	public void product_list(Criteria cri, Model model) throws Exception {
		
		cri.setAmount(4);
		List<ProductVO> list = service.getListWithPaging(cri);
		
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		int total = service.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("productList", list);
	}
	
	//상품수정 폼
	@GetMapping("/productModify")
	public void product_modify(@RequestParam("pro_num") Integer pro_num, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		ProductVO vo = service.product_modify(pro_num);
		vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		model.addAttribute("productVO", vo);
		model.addAttribute("mainCategory", service.mainCategory());
		model.addAttribute("subCategory", service.subCategory(vo.getCate_prt_code()));
	}
	
	//상품수정 저장
	@PostMapping("/productModify")
	public String product_modify(Criteria cri, ProductVO vo, RedirectAttributes rttr) throws Exception {
		
		//1)이미지가 변경된 경우
		if(vo.getUpload().getSize() > 0) {
			
			UploadFileUtils.deleteFile(uploadFolder, vo.getPro_uploadpath(), vo.getPro_img());
			vo.setPro_img(UploadFileUtils.uploadFile(uploadFolder, vo.getUpload()));
			vo.setPro_uploadpath(UploadFileUtils.getFolder()); // 날짜폴더명
		}
		
		service.product_modifyOk(vo);
		
		rttr.addFlashAttribute("msg", "modifyOk");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/product/productList";
	}
	
	//상품리스트의 이미지출력(썸네일)
	@ResponseBody
	@GetMapping("/displayFile")  // (클라이언트에서 보내는 특수문자중에 \ 데이타를 스프링에서 지원하지 않음)
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName);
		
		return entity;
	}
	
	//상품선택삭제(ajax호출).pro_uploadpathArr   400에러발생되면. 클라이언트에서 보낸 데이타를 스프링에서 받지 못하는 상태. (중요)ajax로 사용시 파라미터를 [] 로 사용해야 한다.
	@ResponseBody  
	@PostMapping("/checkDelete")
	public ResponseEntity<String> checkDelete(
				@RequestParam("pro_numArr[]") List<Integer> pro_numArr, 
				@RequestParam("pro_imgArr[]") List<String> pro_imgArr,
				@RequestParam("pro_uploadpathArr[]") List<String> pro_uploadpathArr) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			for(int i=0; i<pro_numArr.size(); i++) {
				//상품이미지 삭제
				UploadFileUtils.deleteFile(uploadFolder, pro_uploadpathArr.get(i), pro_imgArr.get(i));
				
				//상품테이블 삭제작업
				service.product_delete(pro_numArr.get(i));
			}
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//상품개별삭제
	@PostMapping("/productDelete")
	public String productDelete(Criteria cri, @RequestParam("pro_num") Integer pro_num, RedirectAttributes rttr) throws Exception {
		
		System.out.println("상품삭제: " + cri);
		System.out.println("상품코드: " + pro_num);
		
		service.product_delete(pro_num);
		
		rttr.addFlashAttribute("msg", "deleteOk");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/product/productList";
	}
}
