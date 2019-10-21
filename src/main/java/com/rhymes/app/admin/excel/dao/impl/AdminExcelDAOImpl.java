package com.rhymes.app.admin.excel.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.excel.dao.AdminExcelDAO;
import com.rhymes.app.admin.excel.model.DtestDTO;

@Repository
public class AdminExcelDAOImpl implements AdminExcelDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		
		List<DtestDTO> list = sqlSession.selectList("excel.getAllExcel");
		
		return list;
	}

}
