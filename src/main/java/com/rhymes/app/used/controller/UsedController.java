package com.rhymes.app.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsedController {
	

		@RequestMapping("/used")
		public String popup(Model model) {
		System.out.println("public String popup");
		
		return "UsedPopup";
	}
}
