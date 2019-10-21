package com.rhymes.app.admin.exceldown.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.exceldown.dao.AdminExcelDAO;
import com.rhymes.app.admin.exceldown.model.DtestDTO;
import com.rhymes.app.admin.exceldown.service.AdminExcelService;


@Service
public class AdminExcelServiceImpl implements AdminExcelService {

	@Autowired
	AdminExcelDAO AdminExcelDAO;

	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		return AdminExcelDAO.listExcelDownload();
	}
	
}
