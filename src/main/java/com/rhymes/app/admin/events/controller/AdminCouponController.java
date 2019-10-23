package com.rhymes.app.admin.events.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.CouponDTO;

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
	
	@Autowired
	private SqlSession ss;
	
	/**관리자-이벤트-쿠폰관리 뷰
	 * @return
	 */
	@GetMapping(value = "/coupon")
	public String showMypageAdminCoupon(Model model) {
		log.info("showMypageAdminCoupon()");
		//테이블 컬럼 문자열
		String[] cols = {"No", "쿠폰이름", "쿠폰내용", "구분", "기능", "유효기간(월)", "등록일  "};
				
		model.addAttribute("cols", cols);
		
		AdminPointsPagingDTO pDto = new AdminPointsPagingDTO();
		log.info(pDto.toString());
		
		List<CouponDTO> lst = ss.selectList("adcoupon.getTotalCountOfCoupons", pDto);
		
		return "admin/member/mypage/coupon";
	}
	
}
