package com.wine.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	//주문 & 주문 상세
	private int orderno;//주문번호
	private int detailno;//주문상세 번호
	private String userid;//회원 아이디
	private Timestamp indate; //주문일자
	private int prodno; //제품번호
	private int num; //수량
	private String result;//주문 처리 여부 default 1 주문 처리완료 2
	private String message;//배송 요청사항

	private String tel;
	//회원 정보
	private String name;
	private String email;
	private String zipNum;
	private String addr1;
	private String addr2;
	private String phone;

	//제품정보
	private String name_kr;
	private String name_en;
	private String kind_con;
	private String kind;
	private int price;
	private String content_1;
	private String content_2;
	private String image;
	private String mainprod;
	
	private int totalPrice;
	
}
