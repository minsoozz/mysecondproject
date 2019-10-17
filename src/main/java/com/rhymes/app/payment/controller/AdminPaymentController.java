package com.rhymes.app.payment.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.payment.service.AdminPaymentService;

@Controller
public class AdminPaymentController {
	
	@Autowired
	SqlSession SqlSession;
	
	@Autowired
	private AdminPaymentService adminPaymentService;
	
	// 관리자 페이지 교환관리
	@RequestMapping("/admin/payment/exchange")
	public String exchange() {
		System.out.println("AdminPaymentController exchange()");
		
		return "/exchange";
	}

	// 관리자 페이지 환불관리
	@RequestMapping("/admin/payment/refund")
	public String refund() {
		System.out.println("AdminPaymentController refund()");
		
		return "/refund";
	}
	
	// 관리자 페이지 무통장 주문 취소관리
	@RequestMapping("/admin/payment/cancel")
	public String cancel() {
		System.out.println("AdminPaymentController cancel()");
		
		return "/cancel";
	}
	
	// 관리자 페이지 결제성공관리
	@RequestMapping("/admin/payment/success")
	public String success() {
		System.out.println("AdminPaymentController success()");
		
		return "/success";
	}
	
	// 관리자 페이지 결제완료관리
	@RequestMapping("/admin/payment/finish")
	public String finish() {
		System.out.println("AdminPaymentController finish()");
		
		return "/finish";
	}
	
}
