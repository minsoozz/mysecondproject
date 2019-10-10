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
		
	/**후기 뷰를 보여주는 메소드
	 * @param pcp
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/review")
	public String showReview(Principal pcp, Model model) {
		log.info("show review");
		
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
	
	/**새 후기 작성 뷰
	 * @return
	 */
	@GetMapping(value = "/review/writenew")
	public String showWriteNewReview() {
		log.info("showWriteNewReview()");
		return "member/mypage/review/writenew";
	}
	
	
	
	/* 컨트롤러 전용 유틸 메소드 */
	
	/**후기목록 뷰에 넘길 데이터를 만들어 주는 메소드
	 * @param model
	 * @param pageNum
	 * @param pcp
	 * @param type
	 */
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
		System.out.println(type);
		for(String s : keySet) {			
			System.out.println(reviewMap.get(s).toString());
		}
	}
	
	
}
