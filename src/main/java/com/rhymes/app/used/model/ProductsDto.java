package com.rhymes.app.used.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductsDto implements Serializable {
	private int seq;
	private String s_id;
	private String category;
	private String title;
	private String content;
	private int price;
	private int quantity;
	private String place;
	private String photo_1;
	private String photo_2;
	private String photo_3;
	private String photo_4;
	private String photo_5;
	private String division;
	private int likes;
}
