package com.rhymes.app.admin.chart.service.impl;

import java.util.Calendar;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;
import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.admin.chart.service.AdminChartService;
import com.rhymes.app.payment.model.PaymentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminChartServiceImpl implements AdminChartService {
	
	@Autowired
	AdminChartDAO AdminChartDAO;

	// 월별 총 매출
	@Override
	public Map<Integer, Integer> getSalaryMonth(AdminChartSearchDTO dto) {
		// 검색된 날짜가 없었을 때 즉, 처음 들어왔을 때
		if(dto.getSearch_year() == 0) {
			Calendar cal = Calendar.getInstance();
	        dto.setSearch_year(cal.get(Calendar.YEAR));
		}
		return AdminChartDAO.getSalaryMonth(dto);
	}

	// 일별 총 매출
	@Override
	public Map<Integer, Integer> getSalaryDay(AdminChartSearchDTO dto) {
		// 검색된 날짜가 없었을 때 즉, 처음 들어왔을 때
		if(dto.getSearch_year() == 0 && dto.getSearch_month() == 0) {
			Calendar cal = Calendar.getInstance();
	        dto.setSearch_year(cal.get(Calendar.YEAR));
	        dto.setSearch_month(cal.get(Calendar.MONTH));
		}
		return AdminChartDAO.getSalaryDay(dto);
	}

}
