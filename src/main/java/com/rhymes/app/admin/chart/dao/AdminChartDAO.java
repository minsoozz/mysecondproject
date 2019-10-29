package com.rhymes.app.admin.chart.dao;

import java.util.Map;

import com.rhymes.app.admin.chart.model.AdminChartSalaryParam;
import com.rhymes.app.payment.model.PaymentDTO;

public interface AdminChartDAO {

	// 월별 총 매출
	public Map<String, PaymentDTO> getSalaryMonth(AdminChartSalaryParam dto);

	// 일별 총 매출
	public Map<String, PaymentDTO> getSalaryDay(AdminChartSalaryParam dto);

}
