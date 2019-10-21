package com.rhymes.app.admin.excel.service;

import java.util.List;

import com.rhymes.app.admin.excel.model.DtestDTO;

public interface AdminExcelService {
	
	public List<DtestDTO> listExcelDownload() throws Exception;

}
