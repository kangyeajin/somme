package com.wine.model;

import lombok.Data;

@Data
public class AttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long qnano;
	private Long reviewno;
	private Long noticeno;
	private Long eventno;
}
