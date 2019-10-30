package com.rhymes.app.admin.chart.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;
import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.admin.chart.util.AdminChartLastDay;
import com.rhymes.app.admin.chart.util.AdminChartplus0;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AdminChartDAOImpl implements AdminChartDAO {
	
	@Autowired
	SqlSession SqlSession;
	String ns = "adminChart.";

	// 월별 총 매출
	@Override
	public Map<Integer, Integer> getSalaryMonth(AdminChartSearchDTO dto) {
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		AdminChartplus0 var = new AdminChartplus0();

		for (int i = 0; i < 12; i++) {
			log.warn("i : " + i);
			dto.setSearch_month(i + 1);
			log.warn("dto.getSerach_month() : " + dto.getSearch_month());
			String numstr = var.plus0(dto.getSearch_month());
			log.warn("numstr : " + numstr);
			dto.setYear_month(dto.getSearch_year() + "-" + numstr);
			log.warn("AdminChartDAOImpl1 - dto : " + dto.toString());
			int totalprice = SqlSession.selectOne(ns + "getSalaryMonth", dto);
			log.warn("i : " + dto.getSearch_month() + ", total : " + totalprice);
			map.put(dto.getSearch_month(), totalprice);
		}
		return map;
	}

	// 일별 총 매출
	@Override
	public Map<Integer, Integer> getSalaryDay(AdminChartSearchDTO dto) {
		// 그 달의 마지막날 구하기
		int lastday = new AdminChartLastDay().LastDay(dto.getSearch_month());
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();

		for (int i = 0; i < lastday; i++) {
			dto.setSearch_day(i + 1);
			log.warn("AdminChartDAOImpl2 - dto : " + dto.toString());
			int totalprice = SqlSession.selectOne(ns + "getSalaryDay", dto);
			log.warn("i : " + (i + 1) + ", total : " + totalprice);
			map.put((i + 1), totalprice);
		}
		return map;
	}

}
