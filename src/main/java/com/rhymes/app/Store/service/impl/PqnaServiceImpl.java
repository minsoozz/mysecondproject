package com.rhymes.app.Store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.Store.dao.PqnaDao;
import com.rhymes.app.Store.model.PqnaDto;
import com.rhymes.app.Store.service.PqnaService;
import com.rhymes.app.customer.model.CustomerParam;

@Service
public class PqnaServiceImpl implements PqnaService {

	@Autowired
	private PqnaDao PqnaDao;
	
	//Pqna list
	@Override
	public List<PqnaDto> getPqnaList(CustomerParam param) {
	
		return PqnaDao.getPqnaList(param);
	}

	//Pqna count
	@Override
	public int getPqnaCount(CustomerParam param) {
		
		return PqnaDao.getPqnaCount(param);
	}

	//Pqna 업로드
	@Override
	public boolean PqnaUpload(PqnaDto dto) {
	
		return PqnaDao.PqnaUpload(dto);
	}

	//Pqna 디테일
	@Override
	public PqnaDto getPqnaDetail(int seq) {
		
		return PqnaDao.getPqnaDetail(seq);
	}

	//Pqna 수정
	@Override
	public boolean PqnaUpdateAf(PqnaDto dto) {
		
		return PqnaDao.PqnaUpdateAf(dto);
	}

	//Pqna 삭제
	@Override
	public boolean PqnaDelete(int seq) {
		
		return PqnaDao.PqnaDelete(seq);
	}

	//Pqna 답글
	@Override
	public boolean PqnaAnswer(PqnaDto dto) throws Exception {
		
		return PqnaDao.PqnaAnswer(dto);
	}

	
}
