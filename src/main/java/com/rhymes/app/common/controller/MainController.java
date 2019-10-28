package com.rhymes.app.common.controller;

import java.security.Principal;
import java.util.Optional;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.main.model.MainResourceDto;
import com.rhymes.app.admin.main.service.AdminMainService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired AdminMainService mainService;
	
	@GetMapping(value = "")
	public String mainPage(Principal prc, HttpSession session, Model model)throws Exception {
		log.info("mainpage");
			
		MainResourceDto dto = new MainResourceDto();
		dto = mainService.getmainresource();
		
		model.addAttribute("dto", dto);
		
		return "main";
	}

} 





