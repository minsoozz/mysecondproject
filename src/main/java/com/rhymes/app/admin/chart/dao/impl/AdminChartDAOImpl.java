package com.rhymes.app.admin.chart.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;

@Repository
public class AdminChartDAOImpl implements AdminChartDAO {
	
	@Autowired
	SqlSession SqlSession;	
	String c = "adminchart.";

}
