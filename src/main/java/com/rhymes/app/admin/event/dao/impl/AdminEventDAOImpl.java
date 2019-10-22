package com.rhymes.app.admin.event.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.event.dao.AdminEventDAO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;

@Repository
public class AdminEventDAOImpl implements AdminEventDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "adminevent.";

	// 이벤트 리스트
	@Override
	public List<EventDTO> getEventList(EventParam param) {
		return sqlSession.selectList(ns+"getEventList", param);
	}

	// 이벤트 count
	@Override
	public int getEventCount(EventParam param) {
		return sqlSession.selectOne(ns+"getEventCount", param);
	}

	// 이벤트 글 작성
	@Override
	public void geteventwrite(EventDTO dto) {
		sqlSession.insert(ns+"geteventwrite", dto);
	}
}
