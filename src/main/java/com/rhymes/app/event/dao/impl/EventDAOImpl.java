package com.rhymes.app.event.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.event.dao.EventDAO;
import com.rhymes.app.event.model.EventDTO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "event.";

	// 이벤트 리스트
	@Override
	public List<EventDTO> geteventlist() {
		return sqlSession.selectList(ns+"geteventlist");
	}
}
