package com.peachblossom.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	/** 페이지 번호 */
	private Integer	pro_num;
	
	/** 1차 카테고리 */
	private Integer	cate_prt_code;
	
	/** 2차 카테고리 */
	private Integer	cate_code;
	
	/** 제품 이름 */
	private String pro_name;
	
	/** 제품 가격 */
	private int	pro_price;
	
	/** 제품 할인율 */
	private int pro_discount;
	
	/** 제품 제조사 */
	private String pro_publisher;
	
	/** 제품 상세설명 */
	private String pro_content;
	
	/** 제품 이미지 */
	private String pro_img;
	
	/** 제품 업로드경로 */
	private String pro_uploadpath;
	
	/** 제품 수량 */
	private int pro_amount;
	
	/** 제품 판매여부 */
	private String pro_buy;
	
	/** 제품 등록일 */
	private Date pro_date;
	
	/** 제품 수정일 */
	private Date pro_updatedate;
	
	/** 제품 업로드파일 */
	private MultipartFile upload;

}
