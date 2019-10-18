package com.rhymes.app.exceldown.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.exceldown.model.DtestDTO;
import com.rhymes.app.exceldown.dao.ExcelDao;
import com.rhymes.app.exceldown.service.ExcelService;

@Service
public class ExcelServiceImpl implements ExcelService {
	
	@Autowired
	ExcelDao excelDao;

	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		return excelDao.listExcelDownload();
	}

}
