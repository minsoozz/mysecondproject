package com.rhymes.app.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@GetMapping(value = "")
	public String mainPage() {
		//log.info("ddddddddddddddd");
		
		return "main";
	}
}
