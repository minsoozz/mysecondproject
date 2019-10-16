package com.rhymes.app.store.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.store.dao.PreviewDao;
import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PreviewDto;

@Repository
public class PreviewDaoImpl implements PreviewDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Preview.";
	
	//preview list가져오기
	@Override
	public List<PreviewDto> getPreviewList(DetailParam param) {
		List<PreviewDto> list = new ArrayList<PreviewDto>();
		list = sqlSession.selectList(ns +"getPreviewList", param);
		return list;
	}

	@Override
	public int getPreviewCount(DetailParam param) {
		
		return sqlSession.selectOne(ns+"getPreviewCount", param);
	}

	
	
}
