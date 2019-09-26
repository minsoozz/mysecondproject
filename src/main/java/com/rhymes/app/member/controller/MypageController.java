package com.rhymes.app.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;
import com.rhymes.app.member.service.MypageCouponService;
import com.rhymes.app.member.service.MypagePointsService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private MypagePointsService mypagePointsService;
	
	@Autowired
	private MypageCouponService mypageCouponService;
	
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
	public String showPoints(Model model, Principal pcp, @RequestParam(defaultValue = "1") int pageNum) throws Exception {
		log.info("show points");		

		/* 선언부 */
		String userid = pcp.getName();	//세션에 로그인한 id정보
		String totalPoints = "0";	//유효한 적립금 총 액
		String expPoints = "0";	//만료 예정인 적립금 총 액
		int detailCount = mypagePointsService.getCountOnConditions(userid);	//적립금 적립내역 총 개수		
		PointsPagingDTO pDto = new PointsPagingDTO(pageNum, detailCount);	//페이징 DTO	
		List<MemberPointDTO> lst = null;	//적립금 세부내역 리스트
		
		log.info("pDto : " + pDto);
		
		try {
			/* DB통신 */
			lst = mypagePointsService.getDetailsOnConditions(pDto);
			totalPoints = String.format("%,d", mypagePointsService.getAmountOfPointById(userid));
			expPoints = String.format("%,d", mypagePointsService.getAmountOfExpiredPointById(userid) );
		}catch (Exception e) {
			e.printStackTrace();
		}
		
				
		
		model.addAttribute("totalPoints", totalPoints);
		model.addAttribute("expPoints", expPoints);
		model.addAttribute("pointsList", lst);
		model.addAttribute("pDto", pDto);
		
		
		return "member/mypage/points"; 
	}
		
	@GetMapping(value = "/coupon")
	public String showCoupon(Model model, Principal pcp, @RequestParam(defaultValue = "1") int pageNum) {
		log.info("show coupon");
		
		/* 뷰로 보낼 변수 선언 */
		int validCoupons = 0;	//유효한 쿠폰 개수
		List<MemberCouponDTO> couponDetailList = new ArrayList<MemberCouponDTO>();	//쿠폰 정보 리스트
		String userid = pcp.getName();	//현재 로그인한 사용자 아이디
		PointsPagingDTO pDto = null;	//페이징 dto
		
		log.info("변수선언 ok go, 유저아이디:" + userid);
		
		try {
			/* 변수에 알맞은 값 저장 */
			validCoupons = mypageCouponService.getCountOnConditions(userid);
			log.info("쿠폰개수 ok go");
			pDto = new PointsPagingDTO(pageNum, validCoupons, userid);
			log.info("페이징dto ok go");
			couponDetailList = mypageCouponService.getDetailsOnConditions(pDto);
			log.info("리스트 ok go");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		log.info("변수저장 ok go");
		
		/* 저장된 값들을 뷰로 전송 */
		model.addAttribute("validCoupons", validCoupons);
		model.addAttribute("pDto", pDto);
		model.addAttribute("couponDetailList", couponDetailList);
		
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
