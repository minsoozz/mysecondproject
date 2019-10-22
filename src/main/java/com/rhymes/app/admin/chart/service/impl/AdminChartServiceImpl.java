package com.rhymes.app.admin.chart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;
import com.rhymes.app.admin.chart.service.AdminChartService;

@Service
public class AdminChartServiceImpl implements AdminChartService {
	
	@Autowired
	AdminChartDAO AdminChartDAO;

}
