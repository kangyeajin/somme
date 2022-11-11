package com.wine.model;

import lombok.Data;

@Data
public class CartVO {

	//cart
	private int cartno;
	private String userid;
	private int prodno;
	private int no;
	private String result;
	private String indate;

	//prod
	private String name_kr;
	private String name_en;
	private String kind_con;
	private String kind;
	private int price;
	private String content_1;
	private String content_2;
	private String image;
	private String mainprod;

	//
	private int sumPrice;
	private int sumNo;
	private int newNo;
	private int MaxOrderNo;
	private String prodname;
	private int delivery;

	//회원 정보
	private String name;
	private String email;
	private String zipNum;
	private String addr1;
	private String addr2;
	private String phone;
	private String message;


}
