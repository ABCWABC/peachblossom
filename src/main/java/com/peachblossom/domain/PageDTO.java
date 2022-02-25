package com.peachblossom.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri; // 검색정보  -  현재페이지번호(pageNum), 게시물출력 개수(amount), 검색종류(type), 검색어(keyword)
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		int pageSize = 10;
		int endPageInfo = pageSize -1;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)pageSize)) * pageSize;
		this.startPage = this.endPage - endPageInfo;
		
		int realEnd = (int)(Math.ceil((total*1.0) / cri.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
