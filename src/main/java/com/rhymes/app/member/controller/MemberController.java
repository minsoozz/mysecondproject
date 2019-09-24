package com.rhymes.app.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.common.service.CommonService;
import com.rhymes.app.common.service.KakaoAPI;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memService;
	@Autowired
	private KakaoAPI kakao;
	
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

	// 회원가입 선택 창
	@GetMapping("/regiMain")
	public String regimain() {		
		return "rhyregimain";
	}
	// 일반회원 회원가입 창
	@GetMapping("/regimember")
	public String regi2() {		
		return "rhyregimember";
	}
	
	// id체크
	@ResponseBody
	@RequestMapping(method = {RequestMethod.POST,RequestMethod.GET}, path = "/getIDCheck")
	public String getIDCheck(MemberDTO mem) {
		System.out.println("getIDCheck mem toString: " + mem.toString());
		
		int count = memService.getIDCheck(mem);
		System.out.println("count: " + count);
		
		String msg="";
		if(count>0) {
			msg = "YES";
		}else {
			msg = "NO";
		}
		
		return msg;
	}	

	// 회원가입
	@RequestMapping(method = {RequestMethod.POST,RequestMethod.GET},path = "/addmem")
	public String addmem(MemBean bean) {
		System.out.println("addmem mem: " + bean.toString());
		memService.getAddmem(bean);

		return "rhyregisuc";
	}	

	// 카카오 로그인
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model) {
	    String access_Token = kakao.getAccessToken(code);
	    HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("kakaologin Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	    }
	    model.addAttribute("userId", userInfo);
	    
	    return "kakologin";
	}	
	
	// 로그아웃
	@GetMapping("/Klogout")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    return "main/welcome";
	}	
	
}
