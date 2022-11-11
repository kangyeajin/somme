package com.wine.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class EventVO {
	private Long eventno;
	private String subject;
	private String url;
	private String img;
	private String popimg;
	private Date indate;
	private String upload;
	
	private List<AttachVO> attachList;
	private AttachVO attachVO;
}
