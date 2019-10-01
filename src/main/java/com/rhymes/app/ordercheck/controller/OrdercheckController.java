package com.rhymes.app.ordercheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Rhymes")
public class OrdercheckController {
	
	// 주문조회로 이동
	@GetMapping("/ordercheck")
	public String welcome() {
		System.out.println("daraeordercheck");
		
		return "/order";
	}

}
