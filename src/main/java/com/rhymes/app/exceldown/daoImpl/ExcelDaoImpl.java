package com.rhymes.app.exceldown.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.exceldown.dao.ExcelDao;
import com.rhymes.app.exceldown.model.DtestDTO;

@Repository
public class ExcelDaoImpl implements ExcelDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		
		List<DtestDTO> list = sqlSession.selectList("excelDown.getAllExcel");
		
		return list;
	}

}
