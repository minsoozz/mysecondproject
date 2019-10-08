package com.rhymes.app.member.controller;

import java.net.URLDecoder;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberOrderDTO;
import com.rhymes.app.member.model.mypage.MemberOrderPagingDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;
import com.rhymes.app.member.service.MypageCouponService;
import com.rhymes.app.member.service.MypagePersonalService;
import com.rhymes.app.member.service.MypagePointsService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@EnableCaching
@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private MypagePointsService mypagePointsService;
	
	@Autowired
	private MypageCouponService mypageCouponService;
	
	@Autowired
	private MypagePersonalService mypagePersonalService;
	
	@Autowired
	BCryptPasswordEncoder bc;
		
	@GetMapping(value = "/main")
	public String mypageMain() {
		log.info("show main");
		return "member/mypage";
	}
	
	@Autowired
	SqlSession ss;
	
	/**마이페이지메뉴의 랜딩페이지
	 * 로그인한 회원의 주문내역을 보여준다
	 * @param pcp
	 * @param session
	 * @return
	 */
	@GetMapping(value = "/orderlog")
	public String showOrderLog(MemberOrderPagingDTO mOPDto,Principal pcp, HttpSession session) {
		log.info("show OrderLog");
		//선언부
		String userid = pcp.getName();
		DecimalFormat dcFormat = new DecimalFormat("###,###,###");
		
		//마이페이지 상단 메뉴 정보 세션에 등록(적립금, 쿠폰) - EHCache 적용
		try { session.setAttribute("totalPoints", dcFormat.format(mypagePointsService.getAmountOfPointById(userid)));
			}catch(Exception e) { session.setAttribute("totalPoints", "0"); }
		try { session.setAttribute("expPoints", dcFormat.format(mypagePointsService.getAmountOfExpiredPointById(userid)));
			}catch(Exception e) { session.setAttribute("expPoints", "0"); }
		try { session.setAttribute("validCoupons", dcFormat.format(mypageCouponService.getCountOnConditions(userid)));
			}catch(Exception e) { session.setAttribute("validCoupons", "0"); }
		
		//주문내역 리스트 출력
		log.info(mOPDto.toString());
		mOPDto.setUserid(userid);
		List<MemberOrderDTO> lst = ss.selectList("orderlog.getOrderlogsById", mOPDto);
		log.info("startSeq" + mOPDto.getStartSeq() + " , userid : " + mOPDto.getUserid() );
		log.info("lst size : " + lst.size());
		for (int i = 0 ; i < lst.size() ; i ++) {
			log.info(lst.get(i).toString());
		}
		
		
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
	
	
	
	/**Ajax 통신을 통해 비밀번호 확인 후 성공하면 1 리턴
	 * @param model
	 * @param dto
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/personal/confirmpw" , method = RequestMethod.POST )
	public Map<String, String> confirmPw(Model model, @RequestBody String json, Principal pcp) {
		log.info("[ajax] personal information confirm pw"); 
		
		Map<String, String> hm = new HashMap<String, String>();
		
		String userid = "anonymous";
		String formPw = json.split("&")[1].split("=")[1];
		String pw = null;
		boolean ok = false;
		
		try {
			userid = pcp.getName();
			pw = mypagePersonalService.getOnePwById(userid);
			ok = bc.matches(formPw, pw);
			if( ok == false ) {
				hm.put("result", "0");
				return hm;
			}
			hm.put("result", "1");
			
			//비밀번호 확인이 완료되면 상세회원정보를 map타입으로 리턴 
			List<String> authorities = mypagePersonalService.getAuthorities(userid);
		
			if(authorities.contains("ROLE_MEMBER")) {
				//개인회원인 경우
				hm.put("role","member");
				//개인회원 상세정보 get
				P_MemberDTO pMem = mypagePersonalService.getOnePersonalMemberById(userid);
				String[] memDetails = pMem.toJSONString().split(",");
				for(String detail : memDetails) {
					hm.put(detail.split("=")[0].trim(), detail.split("=")[1]);
				}
			} else if(authorities.contains("ROLE_SELLER")) {
				//기업회원인 경우
				hm.put("role", "seller");
			}
		}catch (Exception e) {
			hm.put("result", "0");
			e.printStackTrace();
		}		
				
		return hm;
	}
	
	/**Ajax 통신을 통해 비밀번호 확인 후 회원정보 삭제 성공하면 1 리턴
	 * @param model
	 * @param dto
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/personal/leave/confirmpw" , method = RequestMethod.POST )
	public Map<String, String> confirmPwWhenLeave(Model model, @RequestBody String json, Principal pcp) {
		log.info("[ajax] personal information leave confirm pw" + json); 
		
		Map<String, String> hm = new HashMap<String, String>();
		
		String userid = "anonymous";
		String formPw = json.split("&")[1].split("=")[1];
		String pw = null;
		boolean ok = false;
		
		try {
			userid = pcp.getName();
			pw = mypagePersonalService.getOnePwById(userid);
			//pw = ss.selectOne("member.getFindID_P", pcp.getName());
			ok = bc.matches(formPw, pw);

			if( ok == false ) {
				hm.put("result", "0");
				return hm;
			}else {
				int isDone = mypagePersonalService.updateOneMemberToDisabled(userid);
				log.info("isDone:" + isDone);
				hm.put("result", "1");
			}
		}catch (Exception e) {
			hm.put("result", "0");
			e.printStackTrace();
		}		
				
		return hm;
	}
		
	/**Ajax 통신을 통해 개인회원 정보를 수정하는 메소드
	 * @param model
	 * @param json
	 * @param pcp
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/personal/modinfo" , method = RequestMethod.POST )
	public Map<String, String> modifyPersonalInfo(Model model, @RequestBody String json, Principal pcp, HttpServletRequest req) {
		log.info("[ajax] modify personal information " + json); 
		
		String userid = pcp.getName();	//현재 세션의 사용자 아이디
		@SuppressWarnings("deprecation")
		String[] params = URLDecoder.decode(json).split("&");	//입력받은 폼 정보를 배열로 저장
		Map<String, String> hm = new HashMap<String, String>();	//리턴데이터를 담을 map
			
		//세부정보 저장(rhy_mem_p)
		P_MemberDTO pMDTO = new P_MemberDTO(userid
										, ( (params[2].split("=").length == 1)?"":params[2].split("=")[1])
										, ( (params[3].split("=").length == 1)?"":params[3].split("=")[1])
										, ( (params[4].split("=").length == 1)?"":params[4].split("=")[1])
										, ( (params[5].split("=").length == 1)?"":params[5].split("=")[1])
										, ( (params[7].split("=").length == 1)?"":params[7].split("=")[1])
										, ( (params[8].split("=").length == 1)?"":params[8].split("=")[1])
										, ( (params[9].split("=").length == 1)?"none":params[9].split("=")[1])
										, ( (params[10].split("=").length == 1)?"00000000":params[10].split("=")[1])
										, 0);		

		mypagePersonalService.updateOnePMember(pMDTO);
		
		//기본정보 저장(비밀번호)
		if( params[0].split("=").length == 2 && params[0].split("=").length == 2 ) {
			String inputPw = params[0].split("=")[1];	//입력패스워드
			String confirmPw = params[1].split("=")[1];	//확인패스워드
			if(inputPw.equals(confirmPw)) {
				mypagePersonalService.updateMemberPassword( new MemberDTO(userid, bc.encode(inputPw)) );				
			}else {
				hm.put("result", "0");
				return hm;
			}
		}

		hm.put("result", "1");
		
		return hm;
	}
	
	@GetMapping(value = "/personalform")
	public String showPersonalForm() {
		return "member/mypagepartial/personalform";
	}
  
}
	