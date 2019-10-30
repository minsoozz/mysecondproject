package com.rhymes.app.admin.chart.dao;

import java.util.Map;

import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface AdminChartDAO {

	// 월별 총 매출
	public Map<Integer, Integer> getSalaryMonth(AdminChartSearchDTO dto);

	// 일별 총 매출
	public Map<Integer, Integer> getSalaryDay(AdminChartSearchDTO dto);

}
