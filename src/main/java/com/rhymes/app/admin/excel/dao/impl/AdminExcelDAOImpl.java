package com.rhymes.app.admin.excel.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.excel.dao.AdminExcelDAO;
import com.rhymes.app.admin.excel.model.DtestDTO;
import com.rhymes.app.payment.model.PaymentDTO;

@Repository
public class AdminExcelDAOImpl implements AdminExcelDAO {
	
	@Autowired
	private SqlSession sqlSession;
	String e = "excel";

	// 데이터 다운로드
	@Override
	public List<DtestDTO> listExcelDownload() throws Exception {
		List<DtestDTO> list = sqlSession.selectList(e + "getExcelDown");
		return list;
	}

	// 결제내역 다운로드
	@Override
	public List<PaymentDTO> getPaymentExcelDown() throws Exception {
		List<PaymentDTO> list = sqlSession.selectList(e + "getPaymentExcelDown");
		return list;
	}

}
