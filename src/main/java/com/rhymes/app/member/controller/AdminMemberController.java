package com.rhymes.app.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.service.AdminMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/*")
public class AdminMemberController {

	HttpSession session;

	@Autowired
	AdminMemberService adminMemberService;

	// 회원리스트 관리 view
	@RequestMapping(value = "/memlist", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String memlist(Model model, MemberParam param){
		log.info("show admin memlistview");
		System.out.println("@@@@@@@@@@@@@@@param.toString()"+param.toString());
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MemBean> memlist = adminMemberService.getmemlist(param);
		
		//list 총 수
		int totalRecordCount = adminMemberService.getmemCount(param);
		System.out.println("+++++++++++++totalRecordCount"+totalRecordCount);
		
		model.addAttribute("memlist", memlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);		
		
		// 추가
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
		
		return "memlist"; 
		
	}


	// 쿠폰,적립금 관리 view
	@GetMapping("/mem_cp")
	public String mem_cp() {
		log.info("show admin mem_cp");
		return "mem_cp";
	}

	
	 // member list
	 
	

}
