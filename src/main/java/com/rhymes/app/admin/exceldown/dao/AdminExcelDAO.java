package com.rhymes.app.admin.exceldown.dao;

import java.util.List;

import com.rhymes.app.admin.exceldown.model.DtestDTO;

public interface AdminExcelDAO {
	
	public List<DtestDTO> listExcelDownload() throws Exception;

}
