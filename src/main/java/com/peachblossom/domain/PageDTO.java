package com.peachblossom.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	/** 시작페이지 번호 */
	private int startPage;
	
	/** 끝페이지 번호 */
	private int endPage;
	
	/** 이전페이지, 다음페이지 */
	private boolean prev, next;
	
	/** 총 게시물 수 */
	private int total;
	
	/** 검색정보  -  현재페이지번호(pageNum), 게시물출력 개수(amount), 검색종류(type), 검색어(keyword) */
	private Criteria cri;
	
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
