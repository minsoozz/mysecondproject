package com.rhymes.app.admin.exceldown.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.exceldown.dao.AdminExcelDAO;
import com.rhymes.app.admin.exceldown.service.AdminExcelService;
import com.rhymes.app.admin.exceldown.model.DtestDTO;

@Service
public class AdminExcelServiceImpl implements AdminExcelService {

	@Autowired
	AdminExcelDAO excelDAO;

	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		return excelDAO.listExcelDownload();
	}
	
}
