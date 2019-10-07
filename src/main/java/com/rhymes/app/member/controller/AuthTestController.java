package com.rhymes.app.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.member.util.NaverLoginBO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member/*")
public class AuthTestController {

	@GetMapping("/login")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
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

		return "main";
	}

	@GetMapping("/seller")
	public String sellerMain() {

		log.info("seller");

		return "memtest/seller";
	}

}
