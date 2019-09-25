package com.rhymes.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rhymes.app.member.model.MemberDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@GetMapping(value = "/main")
	public String mypageMain() {
		log.info("show main");
		return "member/mypage";
	}
	
	@GetMapping(value = "/orderlog")
	public String showOrderLog() {
		log.info("show OrderLog");
		return "member/mypage/orderlog";
	}
	
	@GetMapping(value = "/wishlist")
	public String showWishList() {
		log.info("show wishlist");
		return "member/mypage/wishlist";
	}
	
	@GetMapping(value = "/review")
	public String showReview() {
		log.info("show review");
		return "member/mypage/review";
	}
	
	@GetMapping(value = "/points")
	public String showPoints() {
		log.info("show points");
		return "member/mypage/points";
	}
	
	@GetMapping(value = "/coupon")
	public String showCoupon() {
		log.info("show coupon");
		return "member/mypage/coupon";
	}
	
	@GetMapping(value = "/personal")
	public String showPersonal() {
		log.info("show personal information");
		return "member/mypage/personal";
	}
	
	@RequestMapping(value = "/reconfirmpw" , method = RequestMethod.POST )
	public String confirmPw(Model model, MemberDTO dto) {
		log.info("show personal information confirm pw"); 
		log.info("membdr : " + dto);
		return "member/mypage/personal";
	}
}
