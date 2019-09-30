package com.rhymes.app.exceldown.service;

import java.util.List;

import com.rhymes.app.exceldown.model.DtestDTO;

public interface ExcelService {
	
	public List<DtestDTO> listExcelDownload() throws Exception;

}
