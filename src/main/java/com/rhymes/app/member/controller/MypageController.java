package com.rhymes.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@GetMapping(value = "/main")
	public String mypageMain() {
		log.info("show main");
		return "member/mypage/main";
	}
}
