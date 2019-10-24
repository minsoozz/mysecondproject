package com.rhymes.app.admin.main.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.main.dao.AdminMainResourceDao;
import com.rhymes.app.admin.main.model.MainResourceDto;

@Repository
public class AdminMainResourceDaoImpl implements AdminMainResourceDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "mainresourcemanage.";

	@Override
	public MainResourceDto getmainresource() throws Exception {
		return sqlSession.selectOne(ns + "getmainresource");
	}

	@Override
	public boolean updatemainresource(MainResourceDto resource) throws Exception {
		int n = sqlSession.update(ns + "updatemainresource", resource);
		return n>0?true:false;
	}
	
}
