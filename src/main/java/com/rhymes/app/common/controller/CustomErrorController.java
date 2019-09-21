package com.rhymes.app.common.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomErrorController implements ErrorController {

	private static final String PATH = "/error"; 	
	
	@Override
	public String getErrorPath() {
		// TODO Auto-generated method stub
		return PATH;
	}
	
	@RequestMapping(value = PATH)
	public String Error(HttpServletRequest req) {
		
		String status = req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE) + "";
		log.info("Error !!!!!!!!!!!!!! info:" + status);
		
		switch(status) {
			case "403" : return "errors/403"; 
			case "404" : return "errors/404";
			default : return "errors/404";
		}
        
	}
}
