package com.rhymes.app.admin.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.service.AdminPaymentService;
import com.rhymes.app.payment.model.PaymentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/payment")
public class AdminPaymentController {
	
	@Autowired
	private AdminPaymentService adminPaymentService;
	
	// 관리자페이지 결제내역조회
	@RequestMapping("/success")
	public String success(Model model) {
		List<PaymentDTO> orderSuccess = adminPaymentService.getOrderSuccess();
		model.addAttribute("orderSuccess",orderSuccess);
		return "success";
	}
	
	// 관리자페이지 결제상상세내역조회
	@RequestMapping("/detail")
	public String detail(Model model, PaymentDTO dto) {
		List<AdminPaymentDetailDTO> orderDetail = adminPaymentService.getOrderDetail(dto);
		model.addAttribute("orderDetail",orderDetail);
		return "detail";
	}
	
	// 관리자 페이지 교환관리
	@RequestMapping("/exchange")
	public String exchange() {
		log.warn("AdminPaymentController exchange()");
		return "exchange";
	}

//	// 관리자 페이지 환불관리
//	@RequestMapping("/admin/payment/refund")
//	public String refund() {
//		log.warn("AdminPaymentController refund()");
//		
//		return "/refund";
//	}
	
	// 관리자 페이지 무통장 주문 취소관리, 환불관리
	@RequestMapping("/cancel")
	public String cancel() {
		System.out.println("AdminPaymentController cancel()");
		
		return "cancel";
	}
	
//	// 관리자 페이지 결제완료관리
//	@RequestMapping("/admin/payment/finish")
//	public String finish() {
//		log.warn("AdminPaymentController finish()");
//		
//		return "/finish";
//	}
	
}
