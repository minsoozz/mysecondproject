package com.rhymes.app.admin.excel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.excel.dao.AdminExcelDAO;
import com.rhymes.app.admin.excel.model.DtestDTO;
import com.rhymes.app.admin.excel.service.AdminExcelService;


@Service
public class AdminExcelServiceImpl implements AdminExcelService {

	@Autowired
	AdminExcelDAO AdminExcelDAO;

	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		return AdminExcelDAO.listExcelDownload();
	}
	
}
