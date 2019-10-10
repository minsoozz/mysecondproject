package com.rhymes.app.customer.dao;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.PqnaDto;
import com.rhymes.app.customer.model.QnaDto;


public interface PqnaDao {

	//Pqna list가져오기
	public List<PqnaDto> getPqnaList(CustomerParam param);
	
	//Pqna count
	public int getPqnaCount(CustomerParam param);
	
	//Pqna 업로드
	public boolean PqnaUpload(PqnaDto dto);
	
	//Pqna 디테일
	public PqnaDto getPqnaDetail(int seq);
	
	//Pqna 수정
	public boolean PqnaUpdateAf(PqnaDto dto);
	
	//Pqna 삭제
	public boolean PqnaDelete(int seq);
	
	//Pqna 답글
	public boolean PqnaAnswer(PqnaDto dto)throws Exception;
			
}
