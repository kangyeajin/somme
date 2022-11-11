package com.wine.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class QnaVO {
	private Long qnano;
	private String subject;
	private String content;
	private String img;
	private String id;
	private String pwd;
	private String re;
	private Date indate;
	private Long count;
	private String reply;
	private Date reindate;
	
	private List<AttachVO> attachList;
}
