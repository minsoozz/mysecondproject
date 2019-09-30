package com.rhymes.app.customer.service;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;

public interface QnaService {

	//faq list가져오기
	public List<QnaDto> getQnaList(CustomerParam param);
	
	//faq count
	public int getQnaCount(CustomerParam param);
}
