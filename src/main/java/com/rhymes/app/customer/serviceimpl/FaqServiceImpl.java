package com.rhymes.app.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.customer.dao.FaqDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;
import com.rhymes.app.customer.service.FaqService;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDao FaqDao;


	//faq list
	@Override
	public List<FaqDto> getFaqList(CustomerParam param) {
		
		return FaqDao.getFaqList(param);
	}

	//faq count
	@Override
	public int getFaqCount(CustomerParam param) {
		
		return FaqDao.getFaqCount(param);
	}

	//faq detail 가져오기
	@Override
	public FaqDto getFaqDetail(int seq) {
		
		return FaqDao.getFaqDetail(seq);
	}

	//faq upload
	@Override
	public boolean FaqUpload(FaqDto dto) {
		
		return FaqDao.FaqUpload(dto);
	}

	//faq 수정
	@Override
	public boolean FaqUpdateAf(FaqDto dto) {
		
		return FaqDao.FaqUpdateAf(dto);
	}

	//faq 삭제
	@Override
	public boolean FaqDelete(int seq) {
		
		return FaqDao.FaqDelete(seq);
	}
	
	
	
	
}
