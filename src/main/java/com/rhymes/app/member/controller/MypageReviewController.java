package com.rhymes.app.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rhymes.app.member.model.mypage.MemberOrderDetailDTO;
import com.rhymes.app.member.model.mypage.MemberReviewDTO;
import com.rhymes.app.member.model.mypage.MemberReviewPagingDTO;
import com.rhymes.app.member.service.MypageOrderlogService;
import com.rhymes.app.member.service.MypageReviewService;

import lombok.extern.slf4j.Slf4j;

/**마이페이지 컨트롤러
 * orderlog : 주문내역
 * wishlist : 찜 목록
 * review : 상품후기
 * points : 적립금
 * couopn : 쿠폰
 * personal : 개인정보수정
 * @author minhj
 *
 */
@Slf4j
@EnableCaching
@Controller
@RequestMapping("/mypage/*")
public class MypageReviewController {
	
	@Autowired
	private MypageReviewService mypageReviewService;
	
	@Autowired
	private MypageOrderlogService mypageOrderlogService;
	
	@GetMapping(value = "/review")
	public String showReview(Principal pcp, Model model) {
		log.info("show review");
				
		//선언부
		String userid = pcp.getName();	//현재 세션에 로그인된 아이디
//		Map<Boolean, Map<String, List<MemberOrderDetailDTO>>> reviewItems = null;	//리뷰 대상 주문내용들
		
		//map형태 외부 map -> key:리뷰작성여부, value=내부맵 
		//	내부 map -> key:유저ID가 갖는 주문번호, value:세부주문내역
		//유저ID가 갖고있는 유효주문번호들을 List로 가져와서 keySet으로 활용
//		List<String> codeList = mypageReviewService.getPaymentCodesByUserid(userid);
//		reviewItems = mypageReviewService.getTwoMapsSeperatedByWhetherReviewWritten(codeList);
//		
//		model.addAttribute("reviewWritten", reviewItems.get(true));	//리뷰작성한 주문내역
//		model.addAttribute("reviewWrittenKeyset", reviewItems.get(true).keySet().toArray());
//		model.addAttribute("reviewUnWritten", reviewItems.get(false));	//리뷰를 작성하지 않은 주문내역
//		model.addAttribute("reviewUnWrittenKeyset", reviewItems.get(false).keySet().toArray());

		
		//리뷰작성대기 : 현재부터 30일 전 까지의 데이터만 가져온다
		
		//리뷰작성완료 : 모든 데이터를 페이징 규칙에 따라 가져온다
		
		return "member/mypage/review";
	}
	
	/**작성가능 후기목록 뷰를 리턴
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/review/review_sub_wait")
	public String showReviewSubWait(Model model, 
			@RequestParam(defaultValue = "1")int pageNum, Principal pcp) throws Exception {
		log.info("showReviewSubWait()");
		
		setReviewViewModel(model, pageNum, pcp, "false");
				
		return "member/mypage/sub/review_sub_wait";
	}
	
	/**작성가능 후기목록 뷰를 리턴
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/review/review_sub_done")
	public String showReviewSubDone(Model model,
			@RequestParam(defaultValue = "1")int pageNum, Principal pcp) throws Exception {
		log.info("showReviewSubDone()");
		
		setReviewViewModel(model, pageNum, pcp, "true");
		
//		return "member/mypage/sub/review_sub_done";
		return "member/mypage/sub/review_sub_wait";
	}
	
	private void setReviewViewModel(Model model, int pageNum, Principal pcp, String type) {
		//선언부
		String userid = pcp.getName();
		MemberReviewPagingDTO mRPDto = new MemberReviewPagingDTO(userid, pageNum, type);
		Map<String, List<MemberReviewDTO>> reviewMap = null;
		List<String> keySet = null;
				
		//모델 통신
		mRPDto.setTotalSize(mypageReviewService.getReviewCountByIdAndConditions(mRPDto));
		reviewMap = mypageReviewService.getReviewByIdAndOtherConditions(mRPDto);
		keySet = new ArrayList<String>(reviewMap.keySet());
						
		//attr 추가
		model.addAttribute("mRPDto", mRPDto);
		model.addAttribute("reviewMap", reviewMap);
		model.addAttribute("reviewMapKeyset", keySet);
		System.out.println(mRPDto);
	}
}
