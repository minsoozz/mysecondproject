package com.rhymes.app.used.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.used.util.Coolsms;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/used")
@Controller
public class UsedController {

	@GetMapping("/hello") 
	public String test() {
		return "test";
	}
	
	@GetMapping("usedlist")
	public String usedlist() {
		return "usedlist.tiles";
	}
	
	@GetMapping("popup")
	public String popup() {
		return "popup";
	}
	
	@GetMapping("usedwrite")
	public String usedwrite(HttpServletRequest req, Model model) {
		
		MemberDTO dto = new MemberDTO("minsoo", "");
		
		req.getSession().setAttribute("login", dto);
		
		return "usedwrite.tiles";
	}
	
	@RequestMapping(value="used/usedwriteAf", method = RequestMethod.POST)
	public String usedwriteAf() {
		
		System.out.println("도착!!!");
		
		return "redirect:/used/hello";
	}
	
	@GetMapping(value = "/SendSms")
	@ResponseBody
	  public String sendSms(HttpServletRequest request) throws Exception {
		
		System.out.println("sendSms 도착");
		
	    String api_key = "NCSVKDEE4KHSNBFN";
	    String api_secret = "KDPVGPJQJMGFBVB4BQPRZFSAHLQF9DLM";
	  
	    
	    Coolsms coolsms = new Coolsms(api_key, api_secret);
	    
	    HashMap<String, String> set = new HashMap<String, String>();

	    set.put("to", (String)request.getParameter("to")); // 받는 사람
	    set.put("from", "01024943936"); // 발신번호
	    set.put("text", "안녕하세요 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);
	    
	    
	    
	    JSONObject result = coolsms.send(set); // 보내기&전송결과받기
	    
	    
	    
	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }
		
	    return "suc";
	  }
}


