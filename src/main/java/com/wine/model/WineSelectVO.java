package com.wine.model;

import lombok.Data;

@Data
public class WineSelectVO {
	private Long resultno;
	private String intro;
	private String img;
	private String subject;
	private String content;
	private Long prodno;
	private Long count;
}
