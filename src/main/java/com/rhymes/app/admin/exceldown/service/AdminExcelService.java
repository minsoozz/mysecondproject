package com.rhymes.app.admin.exceldown.service;

import java.util.List;

import com.rhymes.app.admin.exceldown.model.DtestDTO;

public interface AdminExcelService {
	
	public List<DtestDTO> listExcelDownload() throws Exception;

}
