package com.rhymes.app.customer.dao;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;

public interface QnaDao {

	//qna list가져오기
	public List<QnaDto> getQnaList(CustomerParam param);
	
	//qna count
	public int getQnaCount(CustomerParam param);
	
}
