package com.rhymes.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/mypage/*")
public class MypageAdminController {

	/**관리자-마이페이지 메인 뷰
	 * @return
	 */
	@GetMapping(value = "/main")
	public String showMypageAdminMain() {
		log.info("showMypageAdminMain(");
		return "admin/member/mypage";
	}
	
	@GetMapping(value = "/coupon")
	public String showMypageAdminCoupon() {
		return "admin/member/mypage/coupon";
	}
}
