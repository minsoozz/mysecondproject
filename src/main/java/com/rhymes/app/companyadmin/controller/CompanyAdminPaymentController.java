package com.rhymes.app.companyadmin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.companyadmin.service.CompanyAdminPaymentService;

@RequestMapping("/admin/company/payment")
@Controller
public class CompanyAdminPaymentController {

	@Autowired
	CompanyAdminPaymentService paymnetService;
	
	@GetMapping("/success")
	public String success() {
		return "";
	}
	
	
}
