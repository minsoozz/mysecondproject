package com.rhymes.app.admin.chart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.chart.service.AdminChartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/chart")
public class AdminChartController {
	
	@Autowired
	AdminChartService PaymentService;
	
	@GetMapping("/salary")
	public String salary() {
		return "/chart/salary";
	}
	
	@GetMapping("/member")
	public String member() {
		return "/chart/member";
	}
	
	@GetMapping("/company")
	public String company() {
		return "/chart/company";
	}
	
	@GetMapping("/product")
	public String product() {
		return "/chart/product";
	}

}
