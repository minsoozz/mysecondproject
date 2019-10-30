package com.rhymes.app.admin.chart.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.admin.chart.service.AdminChartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/chart")
public class AdminChartController {
	
	@Autowired
	AdminChartService PaymentService;
	
	@GetMapping("/salary")
	public String salary(Model model, AdminChartSearchDTO dto) {
		// 월별 총 매출
		Map<Integer, Integer> month_map = PaymentService.getSalaryMonth(dto);
		// 일별 총 매출
		Map<Integer, Integer> day_map = PaymentService.getSalaryDay(dto);
		
		model.addAttribute("month_map", month_map);
		model.addAttribute("day_map", day_map);
		return "/chart/salary";
	}
	
//	@GetMapping("/member")
//	public String member() {
//		return "/chart/member";
//	}
//	
//	@GetMapping("/company")
//	public String company() {
//		return "/chart/company";
//	}
	
	@GetMapping("/product")
	public String product() {
		return "/chart/product";
	}

}
