package com.rhymes.app.Store.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.Store.dao.RegisterDao;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.StockDto;
import com.rhymes.app.Store.model.category.Category2Dto;
import com.rhymes.app.Store.model.category.Category3Dto;

@Repository
public class RegisterDaoImpl implements RegisterDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "register.";
	
	@Override
	public List<Category2Dto> getCate2List(int c1_seq) throws Exception {
		return sqlSession.selectList(ns + "getCate2List", c1_seq);
	}

	@Override
	public List<Category3Dto> getCate3List(int c2_seq) throws Exception {
		return sqlSession.selectList(ns + "getCate3List", c2_seq);
	}

	@Override
	public int getPseq() throws Exception {
		return sqlSession.selectOne(ns + "getPseq");
	}

	@Override
	public boolean insertProduct(ProductDto product) throws Exception {
		int n = sqlSession.insert(ns + "insertProduct", product);
		return n>0?true:false;
	}

	@Override
	public boolean insertStock(StockDto stock) throws Exception {
		int n = sqlSession.insert(ns + "insertStock", stock);
		return n>0?true:false;
	}

	@Override
	public String getSizeunit(int c2_seq) throws Exception {
		System.out.println("c2_seq : " + c2_seq);
		return sqlSession.selectOne(ns + "getSizeunit", c2_seq);
	}
	
}
