package com.rhymes.app.payment.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.service.OrdercheckService;

@Controller
@RequestMapping("/Rhymes")
public class OrdercheckController {
	
	@Autowired
	private OrdercheckService OrdercheckService;
	
	// 비회원 주문조회 인증 페이지로 이동
	@GetMapping("/ordercheck_confirm_move")
	public String ordercheck_confirm_move() {
		System.out.println("darae ordercheck_confirm_move");
		
		return "/order_confirm";
	}
	
	// 주문조회 페이지로 이동
	@ResponseBody
	@GetMapping("/ordercheck_confirm")
	public String ordercheck_confirm(Model model, String name, String code) {
		System.out.println("darae ordercheck_confirm");
		
		// 주문번호, 이름 맞는지 확인
		boolean b = OrdercheckService.confirm(code, name);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	}
	
	// 주문내역 확인 페이지로 이동
	@GetMapping("/ordercheck_move")
	public String ordercheck_move(Model model) {
		System.out.println("darae ordercheck_move");
		
		List<PaymentDTO> ordercheck_list = new ArrayList<PaymentDTO>();
		
		// 주문내역 가져오기
		ordercheck_list = OrdercheckService.getOrdercheck();
		model.addAttribute("ordercheck_list", ordercheck_list);
		
		for(PaymentDTO p : ordercheck_list) {
			//System.out.println("p : " + p);
		}
		
		return "/order_move";
	}

}
