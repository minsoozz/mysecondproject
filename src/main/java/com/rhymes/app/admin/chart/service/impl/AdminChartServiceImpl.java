package com.rhymes.app.admin.chart.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;
import com.rhymes.app.admin.chart.model.AdminChartSalaryParam;
import com.rhymes.app.admin.chart.service.AdminChartService;
import com.rhymes.app.payment.model.PaymentDTO;

@Service
public class AdminChartServiceImpl implements AdminChartService {
	
	@Autowired
	AdminChartDAO AdminChartDAO;

	// 월별 총 매출
	@Override
	public Map<String, PaymentDTO> getSalaryMonth(AdminChartSalaryParam dto) {
		return AdminChartDAO.getSalaryMonth(dto);
	}

	// 일별 총 매출
	@Override
	public Map<String, PaymentDTO> getSalaryDay(AdminChartSalaryParam dto) {
		return AdminChartDAO.getSalaryDay(dto);
	}

}
