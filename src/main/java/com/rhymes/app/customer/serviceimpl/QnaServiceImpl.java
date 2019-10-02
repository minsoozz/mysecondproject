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

	//qna detail
	@Override
	public QnaDto getQnaDetail(int seq) {
		
		return QnaDao.getQnaDetail(seq);
	}

	//qna 글쓰기
	@Override
	public boolean QnaUpload(QnaDto dto) {
		
		return QnaDao.QnaUpload(dto);
	}

	//qna 수정
	@Override
	public boolean QnaUpdateAf(QnaDto dto) {
		
		return QnaDao.QnaUpdateAf(dto);
	}

	//qna 파일명가져오기
	@Override
	public String getfilename(int seq) {
		
		return QnaDao.getfilename(seq);
	}

	//qna 삭제
	@Override
	public boolean QnaDelete(int seq) {
		
		return QnaDao.QnaDelete(seq);
	}

	//qna 답글
	@Override
	public boolean QnaAnswer(QnaDto dto) throws Exception {
		
		return QnaDao.QnaAnswer(dto);
	}
	
	
	
	
}
