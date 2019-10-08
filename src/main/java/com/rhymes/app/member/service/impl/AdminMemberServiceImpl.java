package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.AdminMemberDAO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.service.AdminMemberService;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	// memlist 검색 페이징
	@Override
	public List<MemBean> getmemlist(MemberParam param) {
		return adminMemberDAO.getmemlist(param);
	}

	// list 총 수
	@Override
	public int getmemCount(MemberParam param) {
		return adminMemberDAO.getmemCount(param);
	}

}
