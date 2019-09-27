package com.rhymes.app.customer.dao;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;

public interface FaqDao {

	//faq list가져오기
	public List<FaqDto> getFaqList(CustomerParam param);
	
	//faq count
	public int getFaqCount(CustomerParam param);
	
	//faq 업로드
	public boolean FaqUpload(FaqDto dto);
	
}
