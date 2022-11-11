package com.wine.model;

import lombok.Data;

//첨부파일들의 정보를 저장
@Data
public class AttachFileDTO {
	private String fileName;	//원본 파일 이름
	private String uploadPath;	//업로드 경로
	private String uuid;		//임의의 값
	private boolean image;		//이미지 여부
}
