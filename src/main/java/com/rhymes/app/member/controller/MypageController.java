package com.rhymes.app.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/**적립금 현황 뷰를 보여주는 메소드
	 * @param model
	 * @param pcp
	 * @param pageNum
	 * @return
	 */
	@GetMapping(value = "/points")
	public String showPoints(Model model, Principal pcp, @RequestParam(defaultValue = "1") int pageNum) {
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
			pDto = new PointsPagingDTO(pageNum, detailCount, userid);
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
		
	/**쿠폰 현황 뷰를 보여주는 메소드
	 * @param model
	 * @param pcp
	 * @param pageNum
	 * @return
	 */
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
			//pDto = new PointsPagingDTO(pageNum, validCoupons, 2, userid);
			couponDetailList = mypageCouponService.getDetailsOnConditions(pDto);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		System.out.println(pDto);
		System.out.println("리스트 길이 : " + couponDetailList.size() );
		
		/* 저장된 값들을 뷰로 전송 */
		model.addAttribute("validCoupons", validCoupons);
		model.addAttribute("pDto", pDto);
		model.addAttribute("couponDetailList", couponDetailList);
		
		return "member/mypage/coupon";
	}
	
	/**Ajax 통신을 통해 신규 쿠폰 등록
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/coupon/regicoupon", method = RequestMethod.POST)
	public String regiNewCoupon(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		/* 선언부 */
		String coup_code = jsMap.get("coup_code") + "";
		MemberCouponDetailDTO couponDetailDto = null;	
		MemberCouponDTO couponDto = null;
		String userid = pcp.getName();
		
		/* 수행부 */
		//만료일(만료여부), 사용여부 확인. 사용불가하면 return 0
		try {
			couponDetailDto = mypageCouponService.getCoupInfoByCoupCode(coup_code);		//	couponDetailDto = ss.selectOne("coupon.getCoupInfoByCoupCode", coup_code);
		}catch (Exception e) {
			e.printStackTrace();
			return "0";//올바르지 않은 쿠폰 정보입니다.
		}
		//찾지못했으면 0리턴, 등록된ID(userid)가 있는 쿠폰이면 0리턴
		if( couponDetailDto == null || couponDetailDto.getUserid() != null ) return "0";
		
		//적립인지 할인인지 판단하고 처리 후 return 1
		//적립 : RHY_MEM_COUPON_DETAIL에 사용처리, 정보 등록 RHY_MEM_POINT에도 등록
		//할인 : RHY_MEM_COUPON_DETAIL에만 등록
		couponDto = mypageCouponService.getCoupInfoByCSeq( couponDetailDto.getC_seq() );	//		couponDto = ss.selectOne("coupon.getCoupInfoByCSeq", couponDetailDto.getC_seq() );
		couponDetailDto.setCoup_code(coup_code);
		couponDetailDto.setUserid(userid);
		couponDetailDto.setFunc_time_limit(couponDto.getFunc_time_limit());
		
		if( "적립".equals( couponDto.getFunc() ) ) {	//적립금 추가, 사용처리
			mypagePointsService.addNewPoint(new MemberPointDTO(userid, couponDto.getTitle(), couponDto.getFunc_num()));
			couponDetailDto.setCoup_type(1);
			mypageCouponService.regiNewCoupon(couponDetailDto);	//	ss.update("coupon.regiNewCoupon", couponDetailDto);
		}else if( "할인".equals( couponDto.getFunc() )) {	//쿠폰 등록자 정보 insert
			mypageCouponService.regiNewCoupon(couponDetailDto);	//	ss.update("coupon.regiNewCoupon", couponDetailDto);
		}else {
			
		}		
		
		return "1";
	}
	
	/**Ajax 통신을 통해 리스트에서 특정 쿠폰이 안보이도록 설정
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/coupon/deleteone", method = RequestMethod.POST)
	public String deleteCouponInUserList(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		int seq = Integer.parseInt( jsMap.get("seq") + "" );				
		return mypageCouponService.deleteCouponInList(seq) + "";		
	}
	
	@GetMapping(value = "/personal")
	public String showPersonal() {
		log.info("show personal information");
		return "member/mypage/personal";
	}
	
	@Autowired
	SqlSession ss;
	
	@Autowired
	BCryptPasswordEncoder bc;
	
	/**Ajax 통신을 통해 비밀번호 확인 후 성공하면 1 리턴
	 * @param model
	 * @param dto
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/personal/confirmpw" , method = RequestMethod.POST )
	public String confirmPw(Model model, @RequestBody String json, Principal pcp) {
		log.info("show personal information confirm pw"); 
		
		String formPw = json.split("&")[1].split("=")[1];
		String pw = null;
		boolean ok = false;
		log.info( formPw );		
		
		try {
			pw = ss.selectOne("member.getFindID_P", pcp.getName());
			ok = bc.matches(formPw, pw);
			log.info("pw: " + pw + ", ok : " + ok);
		}catch (Exception e) {
			e.printStackTrace();
		}		
		
		return (ok == true)?"1":"0";
	}
	
	@GetMapping(value = "/personalform")
	public String showPersonalForm() {
		return "member/mypagepartial/personalform";
	}
}
