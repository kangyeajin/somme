package com.wine.model;

import lombok.Data;

@Data
public class ProductVO {
	private int prodno;
	private String name_kr;
	private String name_en;
	private String kind;
	private String kind_con;
	private int price;
	private String content_1;
	private String content_2;
	private String image;
	private String mainprod;
}
