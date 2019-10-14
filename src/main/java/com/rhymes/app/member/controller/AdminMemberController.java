package com.rhymes.app.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.service.AdminMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/*")
public class AdminMemberController {

	HttpSession session;

	@Autowired
	AdminMemberService adminMemberService;

	// 회원 리스트
	@RequestMapping(value = "/memlist", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String memlist(Model model, MemberParam param){
		log.info("show admin memlistview");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MemBean> memlist = adminMemberService.getmemlist(param);
		
		//list 총 수
		int totalRecordCount = adminMemberService.getmemCount(param);
		
		model.addAttribute("memlist", memlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);		
		System.out.println("_________----------__________-------" + param.toString());
		// 추가
			
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
		model.addAttribute("authority",param.getAuthority());
		
		return "memlist"; 
	}
	
	// 업체 리스트
	@RequestMapping(value = "/mem_c_list", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String mem_c_list(Model model, MemberParam param){
		log.info("show admin mem_c_list");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<SellerBean> mem_c_list = adminMemberService.getmem_c_list(param);
		
		//list 총 수
		int totalRecordCount = adminMemberService.getmem_c_Count(param);
		
		model.addAttribute("mem_c_list", mem_c_list);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);		
	
		// 추가
			
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
		model.addAttribute("authority",param.getAuthority());
		
		return "mem_c_list"; 
	}
	
	// 수정창으로 회원정보 불러오기
	@GetMapping("/mem_update")
	public String mem_update(String id, Model model) {
		log.info("show admin mem_update");
		
		P_MemberDTO mem = adminMemberService.getAdMem(id);
		
		model.addAttribute("admem", mem);
		
		return "mem_update";
	}
	
	// 회원정보 수정
	@GetMapping("/mem_updateAf")
	public String mem_updateAf(P_MemberDTO pmem, Model model) {
		log.info("show admin mem_updateAf");

		adminMemberService.getAdMemAf(pmem);
		
		return "redirect:/admin/memlist";
	}
	


	// 쿠폰,적립금 관리 view
	@GetMapping("/mem_cp")
	public String mem_cp() {
		log.info("show admin mem_cp");
		return "mem_cp";
	}

	
	 
	

}
