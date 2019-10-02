package com.rhymes.app.exceldown.dao;

import java.util.List;

import com.rhymes.app.exceldown.model.DtestDTO;

public interface ExcelDao {
	
	public List<DtestDTO> listExcelDownload() throws Exception;

}
