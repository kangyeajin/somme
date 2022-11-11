package com.wine.model;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

//검색의 기준을 정하는 클래스
@Data
public class Criteria {

	private int pageNum;
	private int amount;
	private String prodno;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,5);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum",this.getPageNum())
				.queryParam("amount",this.getAmount())
				.queryParam("type",this.getType())
				.queryParam("keyword",this.getKeyword());
		return builder.toUriString();
	}

	public String getListLink(int i) {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum",this.getPageNum())
				.queryParam("amount",this.getAmount())
				.queryParam("type",this.getType())
				.queryParam("keyword",this.getKeyword())
				.queryParam("prodno",this.getProdno());
		return builder.toUriString();
	}
}
