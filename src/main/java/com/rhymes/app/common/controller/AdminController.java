package com.rhymes.app.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {

	HttpSession session;

	// 회원가입 선택 창
	@GetMapping("/main")
	public String regimain() {
		log.info("show admin main");
		return "AdminMain";
	}
	
	
}