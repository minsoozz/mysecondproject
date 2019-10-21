package com.rhymes.app.admin.excel.dao;

import java.util.List;

import com.rhymes.app.admin.excel.model.DtestDTO;

public interface AdminExcelDAO {
	
	public List<DtestDTO> listExcelDownload() throws Exception;

}
