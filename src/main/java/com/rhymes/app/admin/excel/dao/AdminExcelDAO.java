package com.rhymes.app.admin.excel.dao;

import java.util.List;

import com.rhymes.app.admin.excel.model.DtestDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface AdminExcelDAO {

	// 데이터 다운로드
	public List<DtestDTO> listExcelDownload() throws Exception;
	
	// 결제내역 다운로드
	public List<PaymentDTO> getPaymentExcelDown() throws Exception;

}
