package com.rhymes.app.event.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.event.dao.EventDAO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "event.";
}
