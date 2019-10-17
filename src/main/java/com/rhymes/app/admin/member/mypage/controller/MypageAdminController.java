package com.rhymes.app.admin.member.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**관리자페이지에서 마이페이지 관련 컨트롤러
 * 쿠폰, 적립금
 * @author minhj
 */
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
	
	/**관리자-이벤트-쿠폰관리 뷰
	 * @return
	 */
	@GetMapping(value = "/coupon")
	public String showMypageAdminCoupon() {
		return "admin/member/mypage/coupon";
	}
	
	/**관리자-이벤트-쿠폰관리 뷰
	 * @return
	 */
	@GetMapping(value = "/points")
	public String showMypageAdminPoints(Model model) {
		
		
		
		return "admin/member/mypage/points";
	}
}
