package com.rhymes.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member/*")
public class AuthTestController {
	@GetMapping("/login")
	public String login() {
		log.info("show login view");
		
		return "rhylogin";
	}
	
	@GetMapping("/logout")
	public String logout() {
		
		log.info("do logout");
		
		return "welcome";
	}
	
	
	@GetMapping("/admin")
	public String adminMain() {
		
		log.info("admin");
		
		return "memtest/admin";
	}
	
	@GetMapping("/member")
	public String memberMain() {
		
		log.info("member");
		
		return "memtest/member";
	}
	
	@GetMapping("/seller")
	public String sellerMain() {
		
		log.info("seller");
		
		return "memtest/seller";
	}

	
	
}
