package com.wine.model;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String zipNum;
	private String addr1;
	private String addr2;
	private String phone;
	private String bdate;
	private String agree1;
	private String agree2;
	private String useyn;
	private Timestamp indate;

	private List<AuthVO> authList;
}
