package com.rhymes.app.store.model;

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
public class DetailParam implements Serializable{

	
	// paging
	private int pageNumber = 0;	//시작
	private int recordCountPerPage = 10;	//
	
	// [1 1~10 
	private int start = 1;
	private int end = 10;
	
	private int p_seq=0;
	
		
}