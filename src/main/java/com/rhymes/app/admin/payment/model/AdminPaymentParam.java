package com.rhymes.app.admin.payment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
// 관리자 주문조회에서 검색과 페이징이 될 수 있도록 가져가는 DTO
public class AdminPaymentParam implements Serializable {
	// 리스트 총 개수
	private int totalRecordCount;			// 리스트 총 개수
	
	// search
	private String s_category;				// 검색한 카테고리
	private String s_keyword;				// 검색한 키워드
	
	// paging
	private int pageNumber = 0;				// 클릭한 페이지
	private int recordCountPerPage=3;		// 한 페이지당 글 수
	private int pageCountPerScreen=5;		// 한 페이지당 페이지 수
		
	private int start = 1;
	private int end = 3;
	
	// sorting
	private String sorting="ID";

}
