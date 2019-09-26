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
	private String photo;
	private String photo_sys;
	private String division;
	private int likes;
}
