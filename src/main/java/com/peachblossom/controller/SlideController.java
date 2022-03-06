package com.peachblossom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.PageDTO;
import com.peachblossom.domain.SlideVO;
import com.peachblossom.sevice.SlideService;
import com.peachblossom.util.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/slide/*")
@Controller
public class SlideController {
	
	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	private SlideService service;
	
	// 상품등록폼
	@GetMapping("slideInsert")
	public void slide_insert() {
	}
	
	// 상품리스트의 이미지출력(썸네일)
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName);
		
		return entity;
	}
	
	/*
	//CKEditor 상품설명 이미지.
	@PostMapping("/editor/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/") + fileName;
			
			log.info("업로드폴더 물리적경로: " + uploadPath);
			
			out = new FileOutputStream(new File(uploadPath)); // 0byte의 빈 파일생성
			out.write(bytes);
			out.flush();
			
			String callback = request.getParameter("CKEditorFuncNum");
			
			log.info(callback);
			
			printWriter = response.getWriter();
			String fileUrl = "/upload/" + fileName;
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
	*/
	
	//상품등록 저장
	@PostMapping("/slideInsert")
	public String slide_insert(SlideVO svo, RedirectAttributes rttr) {
		
		log.info("상품정보" + svo);
		
		//1)파일업로드
		svo.setSlide_image(UploadFileUtils.uploadFile(uploadFolder, svo.getUpload()));
		svo.setSlide_uploadpath(UploadFileUtils.getFolder());

		//2)상품정보 저장
		service.slide_insert(svo);
		
		rttr.addFlashAttribute("msg", "insertOk");
		
		return "redirect:/admin/product/slideList";
	}
	
	//상품리스트
	@GetMapping("/slideList")
	public void slide_list(Criteria cri, Model model) {
		
		cri.setAmount(5);
		List<SlideVO> list = service.SlideGetListWithPaging(cri);
		
		// 슬래시를 역슬래시로 바꾸는 구문.
		for(int i=0; i<list.size(); i++) {
			SlideVO svo = list.get(i);
			svo.setSlide_uploadpath(svo.getSlide_uploadpath().replace("\\", "/"));
		}
		
		int total = service.SlideGetTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("slideList", list);
	}
	
	//상품수정 폼
	@GetMapping("/slideModify")
	public void slide_modify(@RequestParam("slide_num") Integer slide_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		//1)상품정보
		SlideVO svo = service.slide_modify(slide_num);
		svo.setSlide_uploadpath(svo.getSlide_uploadpath().replace("\\", "/"));
		model.addAttribute("slideVO", svo); //productVO 이름을 jsp에서 참조
	}
	
	//상품수정 저장(폼에서 상품정보, 페이징정보(검색포함) 전송)
	@PostMapping("/slideModify")
	public String slide_modify(Criteria cri, SlideVO svo, RedirectAttributes rttr) {
		
		//상품이미지 변경을 할 경우는 기존이미지는 삭제한다.
		//상품이미지 변경을 하지 않은 경우는 기존이미지명을 그대로 수정처리한다.
		
		//1)이미지가 변경된 경우
		if(svo.getUpload().getSize() > 0) {
			
			//1)기존이미지정보 파일삭제
			UploadFileUtils.deleteFile(uploadFolder, svo.getSlide_uploadpath(), svo.getSlide_image());
			//2)변경이미지 업로드작업
			svo.setSlide_image(UploadFileUtils.uploadFile(uploadFolder, svo.getUpload()));
			svo.setSlide_uploadpath(UploadFileUtils.getFolder());
		}
		
		service.slide_modifyOk(svo);
		
		rttr.addFlashAttribute("msg", "modifyOk"); // jsp에서 참조.
		
		rttr.addAttribute("pageNum", cri.getPageNum()); // 주소에서 호출되는 메서드 파라미터 참조.
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/product/slideList";
	}
	
	//상품선택삭제(ajax호출).pro_uploadpathArr   400에러발생되면. 클라이언트에서 보낸 데이타를 스프링에서 받지 못하는 상태. (중요)ajax로 사용시 파라미터를 [] 로 사용해야 한다.
	@ResponseBody  
	@PostMapping("/checkDelete")
	public ResponseEntity<String> checkDelete(
				@RequestParam("slide_numArr[]") List<Integer> slide_numArr, 
				@RequestParam("slide_imageArr[]") List<String> slide_imageArr,
				@RequestParam("slide_uploadpathArr[]") List<String> slide_uploadpathArr){
		
		ResponseEntity<String> entity = null;
		
		try {
			for(int i=0; i<slide_numArr.size(); i++) {
				//상품이미지 삭제
				UploadFileUtils.deleteFile(uploadFolder, slide_uploadpathArr.get(i), slide_imageArr.get(i));
				
				//상품테이블 삭제작업
				service.slide_delete(slide_numArr.get(i));
			}
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//상품개별삭제
	@PostMapping("/slideDelete")
	public String slideDelete(Criteria cri, @RequestParam("slide_num") Integer slide_num, RedirectAttributes rttr) {
		
		System.out.println("상품삭제: " + cri);
		System.out.println("상품코드: " + slide_num);
		
		service.slide_delete(slide_num);
		
		rttr.addFlashAttribute("msg", "deleteOk"); // jsp에서 참조.
		
		rttr.addAttribute("pageNum", cri.getPageNum()); // 주소에서 호출되는 메서드 파라미터 참조.
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/product/slideList";
	}

}
