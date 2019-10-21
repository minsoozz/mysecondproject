package com.rhymes.app.admin.excel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.excel.dao.AdminExcelDAO;
import com.rhymes.app.admin.excel.model.DtestDTO;
import com.rhymes.app.admin.excel.service.AdminExcelService;
import com.rhymes.app.payment.model.PaymentDTO;


@Service
public class AdminExcelServiceImpl implements AdminExcelService {

	@Autowired
	AdminExcelDAO AdminExcelDAO;

	// 데이터 다운로드
	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		return AdminExcelDAO.listExcelDownload();
	}

	// 결제내역 다운로드
	@Override
	public List<PaymentDTO> getPaymentExcelDown() throws Exception {
		return AdminExcelDAO.getPaymentExcelDown();
	}

}
