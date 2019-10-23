package com.rhymes.app.admin.events.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

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

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.admin.events.model.CouponDetailPagingDTO;
import com.rhymes.app.admin.events.model.PointsDTO;
import com.rhymes.app.common.util.MypageUtils;

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
	public String showMypageAdminCoupon(Model model, AdminPointsPagingDTO pDto) {
		log.info("showMypageAdminCoupon()");
		
		/* 선언부 */
		String[] cols = {"No", "쿠폰이름", "쿠폰내용", "구분", "기능", "유효기간(월)", "등록일  "}; //테이블 컬럼 문자열
		int totalSize = 0;
		List<CouponDTO> couponList = null;
						
		log.info(pDto.toString());
				
		totalSize = ss.selectOne("adcoupon.getTotalCountOfCoupons", pDto);
		pDto.setTotalSize(totalSize);
		couponList = ss.selectList("adcoupon.getCouponsByConditions", pDto);
		
		log.info(couponList.toString());

		model.addAttribute("cols", cols);
		model.addAttribute("pDto", pDto);
		model.addAttribute("couponList", couponList);
		
		return "admin/member/mypage/coupon";
	}
	
	/**관리자-이벤트-쿠폰관리-쿠폰상세 뷰
	 * @return
	 */
	@GetMapping(value = "/coupon/detail")
	public String showMypageAdminCouponDetail(@RequestParam(defaultValue = "1") int seq, Model model
			, CouponDetailPagingDTO pDto) {
		log.info("showMypageAdminCouponDetail()");
			
		
		/* 선언부 */
		CouponDTO cDto = null;
		List<CouponDetailDTO> couponDetailList = null;
		pDto.setSeq(seq);
		
		//어떤쿠폰인지 추가
		cDto = ss.selectOne("adcoupon.getCouponInfoBySeq", seq);
				
		//쿠폰 디테일 추가(쿠폰번호, 발행일, 사용자, 등록자 등)
		pDto.setTotalSize(ss.selectOne("adcoupon.getTotalCountOfCouponDetail", pDto));
		couponDetailList = ss.selectList("adcoupon.getCouponDetails", pDto);
		log.info("list : " + couponDetailList.toString());

		log.info(pDto.toString());	
		
		model.addAttribute("cDto", cDto);	//쿠폰정보
		model.addAttribute("pDto", pDto);	//쿠폰디테일 페이징정보
		model.addAttribute("couponDetailList", couponDetailList);	//쿠폰디테일 내용
		
		return "admin/member/mypage/sub/coupon_detail";
	}
	
	/**Ajax 통신을 통해 새로운 쿠폰번호 발행
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/coupon/detail/generate", method = RequestMethod.POST)
	public String couponCodeGenerate(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		log.info("couponCodeGenerate()");
		/* 선언부 */
		log.info("c_seq : " + jsMap.get("c_seq"));
		log.info("amount : " + jsMap.get("amount"));
		/* 수행부 */
		//업데이트 완료되면 1리턴, 오류발생하면 0리턴
		int updateResult = 0;
		int amount = 0;
		try {
			amount = Integer.parseInt( jsMap.get("amount") + "" );
			MypageUtils.printRandCoupsTimestamp(amount);
			
			return "1";
		}catch (Exception e) {
			return "0";
		}		
	}
}
