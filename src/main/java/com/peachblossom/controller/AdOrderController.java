package com.peachblossom.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import com.peachblossom.domain.OrderDetailInfo;
import com.peachblossom.domain.OrderVO;
import com.peachblossom.domain.PageDTO;
import com.peachblossom.sevice.AdminOrderService;
import com.peachblossom.util.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * @Class Name : AdOrderController.java
 * @Description : 쇼핑몰 관리자 -주문페이지- 작업을 위한 Controller
 * @Modification Information
 * @
 * @ 수정일              수정자          수정내용
 * @ ----------  --------  ---------------------------
 *   2022.03.28  이유미          최초 생성
 *   2022.04.06  이유미          엑셀데이터 다운 기능 추가
 *
 *  @author 이유미
 *  @since 2022.03.28
 *  @version 1.0
 *  @see
 *
 */

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/order/*")
@Controller
public class AdOrderController {
	
	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	private AdminOrderService oService;

	//관리자 주문페이지 출력
	@GetMapping("/orderList")
	public void orderList(Criteria cri, @RequestParam(value = "startDate", required = false) String startDate, 
							@RequestParam(value = "endDate", required = false) String endDate, Model model) throws Exception {
		
		log.info("시작날짜: " + startDate);
		log.info("종료날짜: " + endDate);
		
		cri.setAmount(2);
		List<OrderVO> list = oService.getListWithPaging(cri, startDate, endDate);
		
		int total = oService.getTotalCount(cri, startDate, endDate);
		model.addAttribute("ord_total", total);
		
		//주문상태별 건수
		model.addAttribute("ord_count",  oService.getOrderStateCount("주문접수"));
		model.addAttribute("ord_pay", oService.getOrderStateCount("결제완료"));
		model.addAttribute("ord_delivery", oService.getOrderStateCount("배송준비중"));
		model.addAttribute("ord_cancel", oService.getOrderStateCount("취소요청"));
		model.addAttribute("ord_change", oService.getOrderStateCount("교환요청"));
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("orderList", list);
	}
	
	//주문상태별 목록보기
	@GetMapping("/orderStateList")
	public String orderStateList(@ModelAttribute("ord_state") String ord_state, Criteria cri, Model model) throws Exception {
		
		cri.setAmount(1);
		List<OrderVO> list = oService.getOrderStateListWithPaging(cri, ord_state);
		
		int total = oService.getOrderStateTotalCount(cri, ord_state);
		model.addAttribute("ord_total", total);
		
		//주문상태별 건수
		model.addAttribute("ord_count",  oService.getOrderStateCount("주문접수"));
		model.addAttribute("ord_pay", oService.getOrderStateCount("결제완료"));
		model.addAttribute("ord_delivery", oService.getOrderStateCount("배송준비중"));
		model.addAttribute("ord_cancel", oService.getOrderStateCount("취소요청"));
		model.addAttribute("ord_change", oService.getOrderStateCount("교환요청"));
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("orderList", list);
		
		return "/admin/order/orderList";
	}
		
	//상태일괄변경, 개별주문상태변경
	@ResponseBody  
	@PostMapping("/orderStateAll")
	public ResponseEntity<String> checkDelete(@RequestParam("ord_codeArr[]") List<Integer> ord_codeArr, 
												@RequestParam("ord_StateArr[]") List<String> ord_StateArr) throws Exception {
		
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
	public ResponseEntity<String> checkDelete(@RequestParam("ord_codeArr[]") List<Integer> ord_codeArr) throws Exception {
	
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
	
	//관리자 주문상세페이지 출력
	@GetMapping("/detailInfo")
	public void detailInfo(Integer ord_code, Model model) throws Exception {
		
		List<OrderDetailInfo> list = oService.ordDetailInfo(ord_code);
		
		for(int i=0; i<list.size(); i++) {
			OrderDetailInfo vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		model.addAttribute("oDetailList", list);
	}
	
	//주문삭제(주문상세테이블만)
	@ResponseBody
	@PostMapping("/detailListDelete")
	public ResponseEntity<String> detailListDelete(Integer ord_code, Integer pro_num) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			oService.ordDetailDelete(ord_code, pro_num);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//상품리스트의 이미지출력(썸네일)
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName );
		
		return entity;
	}
	
	//주문데이타 엑셀다운
	@GetMapping("/excelDown")
	public void excelDown(HttpServletResponse response, Criteria cri) throws Exception {
		
		String startDate = "";
		String endDate = "";
		
		cri.setAmount(2);
		
		List<OrderVO> list = oService.getListWithPaging(cri, startDate, endDate);    // 엑셀파일의 데이타(내용)
		
//		Workbook wb = new HSSFWorkbook();                 // MS-Office 2003년도 버전까지
		Workbook wb = new XSSFWorkbook();                 // MS-Office 2003년도 이후
		
		Sheet sheet = wb.createSheet("주문데이타");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		CellStyle headStyle = wb.createCellStyle();       // 1) 제목행 스타일 적용
		
		headStyle.setBorderTop(BorderStyle.THIN);         // 가는 경계선
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);
		
		headStyle.setFillBackgroundColor(IndexedColors.YELLOW.getIndex());  // 배경은 노랑색
		//headStyle.setFillPattern(FillPatternType.SPARSE_DOTS);            // 배경도트 설정취소
		
		headStyle.setAlignment(HorizontalAlignment.CENTER);                 // 데이타 가운데정렬
		
		
		CellStyle bodyStyle = wb.createCellStyle();       // 2) 데이터행 경계선 스타일 적용
		
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);
		
		row = sheet.createRow(rowNo++);                   // 제목행 작업
		
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주문번호");
		
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주문자");
		
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연락처1");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연락처2");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연락처3");
		
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주문가격");
		
		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주문일");
		
		
		for(OrderVO vo : list) {                         // 데이터 행작업
			
			row = sheet.createRow(rowNo++);
			
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrd_code());
			
			cell = row.createCell(1);            
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrd_name());
			
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrd_tel1());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrd_tel2());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrd_tel3());
			
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrd_price());
			
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrd_regdate());
	
		}
		
		//엑셀출력
		String fileName = "주문데이타.xlsx";
		String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + outputFileName + "\"");
		
		wb.write(response.getOutputStream());
		wb.close();
	
	}
	
}
