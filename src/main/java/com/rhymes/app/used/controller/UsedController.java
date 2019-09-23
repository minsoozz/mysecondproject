package com.rhymes.app.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/used")
public class UsedController {

	@RequestMapping("/hello")
	public String test(Model model) {

		return "test";
	}
	
	@RequestMapping("/SellerPopup")
	public String popup(Model model) {
		System.out.println("도착");
		
		
		return "SellerPopup";
	}
}
