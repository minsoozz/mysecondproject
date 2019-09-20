package com.rhymes.app.member.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MemberDAO;
import com.rhymes.app.member.model.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "member.";
	
	@Override
	public MemberDTO getOneMemberByMemberId(String id) {
		return sqlSession.selectOne( ns + "getOneMemberByMemberId", id);
	}
	
}
