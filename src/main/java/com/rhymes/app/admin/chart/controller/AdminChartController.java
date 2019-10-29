package com.rhymes.app.admin.chart.controller;

import java.util.Calendar;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.chart.model.AdminChartSalaryParam;
import com.rhymes.app.admin.chart.service.AdminChartService;
import com.rhymes.app.payment.model.PaymentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/chart")
public class AdminChartController {
	
	@Autowired
	AdminChartService PaymentService;
	
	@GetMapping("/salary")
	public String salary(Model model) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
        int mon = cal.get(Calendar.MONTH);
        int day = cal.get(Calendar.DAY_OF_MONTH);
		
		AdminChartSalaryParam dto = new AdminChartSalaryParam(year, mon, day);
		// 월별 총 매출
		Map<String, PaymentDTO> month_map = PaymentService.getSalaryMonth(dto);
		// 일별 총 매출
		Map<String, PaymentDTO> day_map = PaymentService.getSalaryDay(dto);
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
