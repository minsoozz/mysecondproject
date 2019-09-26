package com.rhymes.app.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.customer.dao.NoticeDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;
import com.rhymes.app.customer.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao NoticeDao;
	
	
	//리스트 가져오기
	@Override
	public List<NoticeDto> getNoticeList(CustomerParam param){
		

		return NoticeDao.getNoticeList(param);
	}

	//get count
	@Override
	public int getNoticeCount(CustomerParam param) {
		
		return NoticeDao.getNoticeCount(param);
	}



	//디테일 가져오기
	@Override
	public NoticeDto getNoticeDetail(int seq) {
		
		return NoticeDao.getNoticeDetail(seq);
	}

	
	
	
	
	//readcount 증가
	@Override
	public boolean NoticeUpRead(int seq) {
		
		return NoticeDao.NoticeUpRead(seq);
	}


	//notice 올리기
	@Override
	public boolean NoticeUpload(NoticeDto dto) {
		
		
		return NoticeDao.NoticeUpload(dto);
	}


	//notice 수정
	@Override
	public boolean NoticeUpdateAf(NoticeDto dto) {
		
		return NoticeDao.NoticeUpdateAf(dto);
	}


	
	//파일명가져오기
	@Override
	public String getfilename(int seq) {
		
		return NoticeDao.getfilename(seq);
	}


	//삭제
	@Override
	public boolean NoticeDelete(int seq) {
	
		return NoticeDao.NoticeDelete(seq);
	}
	
	
	
	
}
