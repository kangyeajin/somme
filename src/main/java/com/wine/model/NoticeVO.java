package com.wine.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {
	private Long noticeno;
	private String subject;
	private String content;
	private String img;
	private String id;
	private Date indate;
	private Long count;
	
    private List<AttachVO> attachList;
}
