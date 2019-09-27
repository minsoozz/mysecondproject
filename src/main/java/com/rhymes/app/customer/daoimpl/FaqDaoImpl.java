package com.rhymes.app.customer.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.customer.dao.FaqDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Faq.";
	
	//faq list 가져오기
	@Override
	public List<FaqDto> getFaqList(CustomerParam param) {
		
		List<FaqDto> list = new ArrayList<FaqDto>();
		list = sqlSession.selectList(ns +"getFaqList", param);
		
		return list;
	}
	
	//faq count
	@Override
	public int getFaqCount(CustomerParam param) {
		
		return sqlSession.selectOne(ns+"getFaqCount", param);
	}

	//faq upload
	@Override
	public boolean FaqUpload(FaqDto dto) {
		int n = sqlSession.insert(ns+"FaqUpload", dto);
		return n>0?true:false;
	}
	
	
	
	
	
	
}
