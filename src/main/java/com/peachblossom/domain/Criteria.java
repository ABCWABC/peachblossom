package com.peachblossom.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	/** 페이지 번호 */
	private int pageNum;
	
	/** 페이지당 글의 수 */
	private int amount;
	
	/** 검색어 종류 */
	private String type;
	
	/** 검색 키워드 */
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
																		.queryParam("amount", this.getAmount())
																		.queryParam("type", this.getType())
																		.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}
