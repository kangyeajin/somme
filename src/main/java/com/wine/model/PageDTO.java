package com.wine.model;

import lombok.Data;

@Data
public class PageDTO {
	//맨처음 페이지 번호
	private int startPage;
	//맨끝 페이지 번호
	private int endPage;
	//이전 페이지, 다음 페이지 (있으면 true)
	private boolean prev, next;
	
	//전체 번호
	private int total;
	//현재 페이지 번호, 띄워줄 글 갯수
	private Criteria cri;
	
	private prodCriteria cri2;
	
	public PageDTO(Criteria cri, int total, double div, int multi, int minus) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int) (Math.ceil(cri.getPageNum() / div)) * multi;
		this.startPage = this.endPage - minus;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	public PageDTO(prodCriteria cri2, int total) {
		this.cri2 = cri2;
		this.total = total;
		this.endPage = (int) (Math.ceil(cri2.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri2.getAmount()));
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
