package com.rhymes.app.admin.chart.dao.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;
import com.rhymes.app.admin.chart.model.AdminChartSalaryParam;
import com.rhymes.app.payment.model.PaymentDTO;

@Repository
public class AdminChartDAOImpl implements AdminChartDAO {
	
	@Autowired
	SqlSession SqlSession;
	String ns = "adminChart.";

	// 월별 총 매출
	@Override
	public Map<String, PaymentDTO> getSalaryMonth(AdminChartSalaryParam dto) {
		return SqlSession.selectMap(ns + "getSalaryMonth", dto, "totalprice");
	}

	// 일별 총 매출
	@Override
	public Map<String, PaymentDTO> getSalaryDay(AdminChartSalaryParam dto) {
		return SqlSession.selectMap(ns + "getSalaryDay", dto, "totalprice");
	}

}
