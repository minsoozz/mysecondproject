package com.rhymes.app.admin.used.dao.impl;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.used.dao.AdminUsedDao;
import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.used.model.ProductsDto;

@Repository
public class AdminUsedDaoImpl implements AdminUsedDao {
	
	@Autowired
	SqlSession sqlSession;

	String ns = "adminUsed.";
	
	@Override
	public List<ProductsDto> getAdminUsedlist(ProductsDto pDto) {
		List<ProductsDto> ulist = sqlSession.selectList(ns+"getAdminUsedlist");
		return ulist;
	}

	@Override
	public int getAdminBbsCount(AdminBbsParam adparam) {
		int count = sqlSession.selectOne(ns + "getAdminBbsCount",adparam);
		
		return count;
	}
	
}
