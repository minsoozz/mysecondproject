package com.rhymes.app.used.model;

import java.io.Serializable;
import java.sql.Date;

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
	private int readcount;
	private Date rdate;
	
	private String photo_list[];

	public ProductsDto(int seq, String s_id, String category, String title, String content, int price, int quantity,
			String place, String photo, String photo_sys, String division, int likes) {
		super();
		this.seq = seq;
		this.s_id = s_id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.price = price;
		this.quantity = quantity;
		this.place = place;
		this.photo = photo;
		this.photo_sys = photo_sys;
		this.division = division;
		this.likes = likes;
	}


	public ProductsDto(int seq, String s_id, String category, String title, String content, int price, int quantity,
			String place, String photo, String photo_sys, String division, int likes, int readcount, Date rdate) {
		super();
		this.seq = seq;
		this.s_id = s_id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.price = price;
		this.quantity = quantity;
		this.place = place;
		this.photo = photo;
		this.photo_sys = photo_sys;
		this.division = division;
		this.likes = likes;
		this.readcount = readcount;
		this.rdate = rdate;
	}
}
