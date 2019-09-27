package com.rhymes.app.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
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
		int detailCount = 0;	//적립금 적립내역 총 개수		
		PointsPagingDTO pDto = null;	//페이징 DTO	
		List<MemberPointDTO> lst = null;	//적립금 세부내역 리스트
				
		try {
			/* DB통신 */
			detailCount = mypagePointsService.getCountOnConditions(userid);
			pDto = new PointsPagingDTO(pageNum, detailCount);
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
				
		try {
			/* 변수에 알맞은 값 저장 */
			validCoupons = mypageCouponService.getCountOnConditions(userid);
			pDto = new PointsPagingDTO(pageNum, validCoupons, userid);
			couponDetailList = mypageCouponService.getDetailsOnConditions(pDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* 저장된 값들을 뷰로 전송 */
		model.addAttribute("validCoupons", validCoupons);
		model.addAttribute("pDto", pDto);
		model.addAttribute("couponDetailList", couponDetailList);
		
		return "member/mypage/coupon";
	}
	
	@Autowired
	SqlSession ss;
	
	/**Ajax 통신을 통해 로그인 가능 여부를 검사하고 가능한 경우 로그인 수행
	 * @param mem
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/coupon/usecoupon", method = RequestMethod.POST)
	public String doLogin(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		/* 선언부 */
		String coup_code = jsMap.get("coup_code") + "";
		MemberCouponDetailDTO cDDto = null;	
		MemberCouponDTO cDto = null;
		String userid = pcp.getName();
		
		log.info("쿠폰코드 : " + coup_code);
		
		//만료일(만료여부), 사용여부 확인. 사용불가하면 return 0
		try {
			cDDto = ss.selectOne("coupon.getCoupInfoByCoupCode", coup_code);
		}catch (Exception e) {
			e.printStackTrace();
			return "0";//올바르지 않은 쿠폰 정보입니다.
		}
		log.info("결과1 : " + cDDto);
		if( cDDto == null ) return "0";
		
				
		//적립인지 할인인지 판단하고 처리 후 return 1
		//적립 : RHY_MEM_COUPON_DETAIL에 정보 등록하고 RHY_MEM_POINT에도 등록
		//할인 : RHY_MEM_COUPON_DETAIL에만 등록
		cDto = ss.selectOne("coupon.getCoupInfoByCSeq", cDDto.getC_seq() );
		log.info("결과2 : " + cDto);
		
		if( "적립".equals( cDto.getFunc() ) ) {
			
		}else if( "할인".equals( cDto.getFunc() )) {
			
		}else {
			
		}
		
		
		
		return "1";
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
