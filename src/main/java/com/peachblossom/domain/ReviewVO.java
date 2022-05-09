package com.peachblossom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	/** 리뷰 번호 */
	private Integer rew_num;
	
	/** 회원 아이디 */
	private String mb_id;
	
	/** 제품 번호 */
	private Integer pro_num;
	
	/** 리뷰 내용 */
	private String rew_content;
	
	/** 리뷰 별점 */
	private int rew_score;
	
	/** 리뷰 등록일 */
	private Date rew_regdate;

}
