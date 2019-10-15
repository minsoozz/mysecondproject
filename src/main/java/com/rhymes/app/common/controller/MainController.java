package com.rhymes.app.common.controller;

import java.security.Principal;
import java.util.Optional;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@GetMapping(value = "")
	public String mainPage(Principal prc, HttpSession session) {
		log.info("mainpage");
		
		/*
		 * String username = prc.getName(); if(username == null) { return "rhymain";
		 * 
		 * }else { return "main";
		 * 
		 * }
		 */
		
		/*
		 * if(prc.getName() == null) { return "main"; }else {
		 * 
		 * session.setAttribute("userloginid", prc.getName());
		 * 
		 * return "main"; }
		 */
		return "main";
		
	}

}




/*
@RequestMapping(value = "/main")
public class MainController {
	
	@GetMapping(value = "/main")
	public String mainPage() {
		log.info("mainpage");
		
		return "main";
	}
}
*/