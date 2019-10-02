package com.rhymes.app.ordercheck.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.payment.model.PaymentDTO;

@Controller
@RequestMapping("/Rhymes")
public class OrdercheckController {
	
	// 비회원 주문조회 인증 페이지로 이동
	@GetMapping("/ordercheck_confirm")
	public String ordercheck_confim() {
		System.out.println("daraeordercheck_confirm");
		
		return "/order_confirm";
	}
	
	// 주문조회 페이지로 이동
	@GetMapping("/ordercheck")
	public String ordercheck(Model model) {
		System.out.println("daraeordercheck");
		
		List<PaymentDTO> ordercheck_list = new ArrayList<PaymentDTO>();
		
		model.addAttribute("ordercheck_list", ordercheck_list);
		
		return "/order";
	}

}
