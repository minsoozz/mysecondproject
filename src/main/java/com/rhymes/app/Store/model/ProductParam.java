package com.rhymes.app.Store.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductParam implements Serializable {

	// 검색
	private String keyword;	  // 검색어
	private String criterion; // 상품이름 OR 브랜드이름
	
	// 카테고리
	private String c1_name;
	private String c2_name;
	private String c3_name;
	
	// 페이징
	private int pageNumber = 0;
	private int recordCountPerPage = 10;
	
	// DB용 변수 : [1] ~ [12]
		private int start = 1;
		private int end = 12;
	
	
		
		
	
}
