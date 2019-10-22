package com.rhymes.app.admin.events.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;

import lombok.extern.slf4j.Slf4j;

/**관리자페이지에서 이벤트관련 컨트롤러
 * @author minhj
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/mypage/*")
public class AdminCouponController {

	/**관리자-마이페이지 메인 뷰
	 * @return
	 */
	@GetMapping(value = "/main")
	public String showMypageAdminMain() {
		log.info("showMypageAdminMain()");
		return "admin/member/mypage";
	}
	
	/**관리자-이벤트-쿠폰관리 뷰
	 * @return
	 */
	@GetMapping(value = "/coupon")
	public String showMypageAdminCoupon() {
		return "admin/member/mypage/coupon";
	}
	
}
