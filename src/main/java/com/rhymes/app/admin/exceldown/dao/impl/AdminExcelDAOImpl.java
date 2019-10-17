<<<<<<< HEAD:src/main/java/com/rhymes/app/exceldown/daoImpl/ExcelDaoImpl.java
package com.rhymes.app.exceldown.daoimpl;
=======
package com.rhymes.app.admin.exceldown.dao.impl;
>>>>>>> master:src/main/java/com/rhymes/app/admin/exceldown/dao/impl/AdminExcelDAOImpl.java

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.rhymes.app.admin.exceldown.dao.AdminExcelDAO;
import com.rhymes.app.admin.exceldown.model.DtestDTO;

public class AdminExcelDAOImpl implements AdminExcelDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		
		List<DtestDTO> list = sqlSession.selectList("excelDown.getAllExcel");
		
		return list;
	}

}
