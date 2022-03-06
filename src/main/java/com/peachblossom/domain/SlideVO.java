package com.peachblossom.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SlideVO { //slide_num, slide_turn, slide_image, slide_name, slide_updatedate, slide_uploadpath
	
	private Integer slide_num;
	private String slide_turn; // (게시안함, 1, 2, 3) 을 선택가능
	private String slide_image;
	private String slide_name;
	private String slide_uploadpath;
	private Date slide_updatedate;
	
	private MultipartFile upload;

}
