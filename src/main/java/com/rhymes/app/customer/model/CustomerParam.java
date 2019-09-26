package com.rhymes.app.customer.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CustomerParam implements Serializable{

	// search
	private String s_category; //제목, 내용, 작성자
	private String s_keyword;	// 검색어
	
	// paging
	private int pageNumber = 0;	//현재 페이지 0부터 시작
	private int recordCountPerPage = 10;	//표현할 한 페이지의 글수
	
	// [1]페이지는 -> 1~10 의 글을 불러와야함 DB용
	private int start = 1;
	private int end = 10;
		
}
