package com.rhymes.app.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.common.dao.CommonDAO;
import com.rhymes.app.common.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDAO commondao;

	// 회원 전체 count
	@Override
	public int getAllMemberList() {
		return commondao.getAllMemberList();
	}

	// 오늘 가입한 회원 count
	@Override
	public int getNewMemCount(String mTime) {
		return commondao.getNewMemCount(mTime);
	}
	
	

	
}
