package com.rhymes.app.customer.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.customer.dao.QnaDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Qna.";
	
	//qna list가져오기
	@Override
	public List<QnaDto> getQnaList(CustomerParam param) {
		
		List<QnaDto> list = new ArrayList<QnaDto>();
		list = sqlSession.selectList(ns +"getQnaList", param);
		
		return list;
	}
	
	//qna count가져오기
	@Override
	public int getQnaCount(CustomerParam param) {
		
		return sqlSession.selectOne(ns+"getQnaCount", param);
	}
	
	
}
