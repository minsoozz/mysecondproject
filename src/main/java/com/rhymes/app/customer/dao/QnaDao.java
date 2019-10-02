package com.rhymes.app.customer.dao;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;

public interface QnaDao {

	//qna list가져오기
	public List<QnaDto> getQnaList(CustomerParam param);
	
	//qna count
	public int getQnaCount(CustomerParam param);
	
	//qna 디테일 가져오기
	public QnaDto getQnaDetail(int seq);
	
	//qna 업로드
	public boolean QnaUpload(QnaDto dto);
	
	//qna 수정
	public boolean QnaUpdateAf(QnaDto dto);

	//qna 파일이름가져오기
	public String getfilename(int seq);
	
	//qna 삭제
	public boolean QnaDelete(int seq);
	
	//qna 답글
	public boolean QnaAnswer(int seq,QnaDto dto)throws Exception;
		
}
