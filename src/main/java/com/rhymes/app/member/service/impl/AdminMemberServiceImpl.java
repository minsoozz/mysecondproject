package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.AdminMemberDAO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
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

	// 수정창으로 회원정보 불러오기
	@Override
	public P_MemberDTO getAdMem(String id) {
		return adminMemberDAO.getAdMem(id);
	}

	// 회원정보 수정
	@Override
	public void getAdMemAf(P_MemberDTO pmem) {
		adminMemberDAO.getAdMemAf(pmem);
	}

	// 업체 리스트
	@Override
	public List<SellerBean> getmem_c_list(MemberParam param) {
		return adminMemberDAO.getmem_c_list(param);
	}

	// 업체 리스트 count
	@Override
	public int getmem_c_Count(MemberParam param) {
		return adminMemberDAO.getmem_c_Count(param);
	}

}
