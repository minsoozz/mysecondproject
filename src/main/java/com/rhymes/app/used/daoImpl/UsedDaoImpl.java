package com.rhymes.app.used.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.ProductsDto;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	SqlSession sqlSession;

	String ns = "Used.";

	@Override
	public boolean UsedWrite(ProductsDto dto) {
		// TODO Auto-generated method stub

		int n = sqlSession.insert(ns + "write", dto);

		System.out.println("n : " + n);

		return n > 0 ? true : false;
	}

	@Override
	public List<ProductsDto> getUsedList() {
		// TODO Auto-generated method stub

		List<ProductsDto> list = sqlSession.selectList(ns + "getUsedList");

		return list;
	}

	@Override
	public ProductsDto getUsedDetail(int seq) {
		// TODO Auto-generated method stub

		ProductsDto dto = sqlSession.selectOne(ns + "getUsedDetail", seq);

		return dto;
	} 

}
