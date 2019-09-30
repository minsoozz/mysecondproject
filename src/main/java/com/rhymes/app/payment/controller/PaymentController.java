package com.rhymes.app.payment.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.payment.util.Coolsms;

@Controller
@RequestMapping("/Rhymes")
public class PaymentController {
	
	// 처음
	@GetMapping("/daraewelcome")
	public String welcome() {
		System.out.println("daraewelcome");
		
		return "daraewelcome";
	}
	
	// 결제페이지로 이동
	@GetMapping("/payment")
	public String payment(Model model) {
		System.out.println("daraepayment");
		
		if(true) {
			// 로그인 되어있으면 결제 페이지로 이동
			return "payment";
		}else {
			// 로그인 안되어있으면 로그인창으로 이동
			return "nomembership";
		}
		
	}
	
	// 결제 완료
	@GetMapping("/paymentAf")
	public String paymentAf(Model model) {
		System.out.println("daraepaymentAf");

		return "paymentAf";
	}

	// 주소찾기 팝업창 띄우기
	@GetMapping("/addresssearch")
	public String addresssearch(Model model) {
		System.out.println("daraeaddresssearch");
		
		return "addresssearch";
	}
	
	// 본인인증
	@ResponseBody
	@RequestMapping(value = "/sendsms", method = RequestMethod.POST)
	public String sendSms(HttpServletRequest request) throws Exception {		
		System.out.println("darae본인인증");
		System.out.println("받는번호 : " + (String) request.getParameter("to"));
		System.out.println("인증번호 : " + (String) request.getParameter("text"));

		String api_key = "NCS4ZFTWNHGBIKUM";
		String api_secret = "TPH57XEIXFFDAUXJV3EBNDDS633YNFG2";

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();

		set.put("to", (String) request.getParameter("to")); // 받는 사람
		set.put("from", "01011112222"); // 발신번호
		set.put("text", "안녕하세요 인증번호는 [" + (String) request.getParameter("text") + "]입니다"); // 문자내용
		set.put("type", "sms"); // 문자 타입

		return "success";
	}
	
	
}













