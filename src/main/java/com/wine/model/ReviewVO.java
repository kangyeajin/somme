package com.wine.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReviewVO {
	private Long reviewno;
	private Long prodno;
	private String subject;
    private String content;
    private String img;
    private String id;
    private String pwd;
    private Date indate;
    private Long count;
    private String best;
    private String name_kr;
    private String image;
    private Long replyCount;
    private Long loveCount;
    
    private List<AttachVO> attachList;
    private AttachVO attachVO;
}
