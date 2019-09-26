package com.rhymes.app.used.daoImpl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.ProductsDto;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Used.";
	
	
	@Override
	public boolean UsedWrite(ProductsDto dto) {
		// TODO Auto-generated method stub
		

		
		
		int n = sqlSession.insert("write", dto);
		
		System.out.println("n : " + n);
		
		return	n > 0 ? true : false;
	}
	
	
}