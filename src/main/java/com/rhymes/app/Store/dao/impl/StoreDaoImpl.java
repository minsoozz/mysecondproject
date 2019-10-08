package com.rhymes.app.Store.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.Store.dao.StoreDao;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.ProductParam;
import com.rhymes.app.Store.model.category.Category2Dto;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "store.";
	
	@Override
	public List<String> getCompanyList() throws Exception {
		return sqlSession.selectList(ns + "getCompanyList");
	}

	@Override
	public List<Category2Dto> getCate2List(Category2Dto dto) throws Exception {
		return sqlSession.selectList(ns + "getCompanyList", dto );
	}

	@Override
	public List<ProductDto> getProductList(ProductParam param) throws Exception {
		return sqlSession.selectList(ns + "getProductList");
	}

	@Override
	public int getProductCnt(ProductParam param) throws Exception {
		int cnt = sqlSession.selectOne(ns + "productCnt", param);
		return 0;
	}

}
