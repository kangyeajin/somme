package com.wine.model;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class prodCriteria {
	private int pageNum;
	private int amount;
	private String prodno;
	private Long qnano;

	private String type;
	private String keyword;

	private String name;

	public prodCriteria() {
		this(1, 10);
	}

	public prodCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();
	}
	public String getListLink(int i) {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword())
				.queryParam("qnano", this.getQnano());
		
		return builder.toUriString();
	}
}
