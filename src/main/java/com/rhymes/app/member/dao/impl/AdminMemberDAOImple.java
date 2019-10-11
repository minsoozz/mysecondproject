package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.AdminMemberDAO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.model.P_MemberDTO;

@Repository
public class AdminMemberDAOImple implements AdminMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "admem.";
	
	// memlist 페이징
	@Override
	public List<MemBean> getmemlist(MemberParam param) {
		return sqlSession.selectList(ns+"getmemlist", param);
	}

	// list 총 수
	@Override
	public int getmemCount(MemberParam param) {
		return sqlSession.selectOne(ns+"getmemCount", param);
	}

	// 수정창으로 회원정보 불러오기
	@Override
	public P_MemberDTO getAdMem(String id) {
		return sqlSession.selectOne(ns+"getAdMem", id);
	}

	@Override
	public void getAdMemAf(P_MemberDTO pmem) {
		sqlSession.update(ns+"getAdMemAf", pmem);
	}
	
}
