package com.rhymes.app.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.service.QnaService;
import com.rhymes.app.customer.dao.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao QnaDao;

	//qna list
	@Override
	public List<QnaDto> getQnaList(CustomerParam param) {
		
		return QnaDao.getQnaList(param);
	}

	//qna count
	@Override
	public int getQnaCount(CustomerParam param) {
		
		return QnaDao.getQnaCount(param);
	}
	
	
	
	
}
