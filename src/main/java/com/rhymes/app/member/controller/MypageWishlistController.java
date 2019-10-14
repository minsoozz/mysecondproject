package com.rhymes.app.member.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.mypage.MemberReviewBbsDTO;
import com.rhymes.app.member.model.mypage.MemberWishlistDTO;

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
@Controller
@RequestMapping("/mypage/*")
public class MypageWishlistController {
	
	@Autowired
	SqlSession ss;

	/**위시리스트 페이지를 보여주는 메소드
	 * @return
	 */
	@GetMapping(value = "/wishlist")
	public String showWishList(Model model, Principal pcp) {
		log.info("show wishlist");
		
		//선언부
		List<MemberWishlistDTO> wishList = null;
		String userid = pcp.getName();
		
		//Service 통신
		wishList = ss.selectList("wishlist.getWishlistById", userid);
		
		//attr 추가
		model.addAttribute("wishList", wishList);
		
		return "member/mypage/wishlist";
	}
	
	
	
	/* Ajax 통신 */
	/**Ajax통신을 통해 새 후기 게시물을 저장하고 주문내역디테일에 리뷰작성여부를 true로 변경하는 메소드.
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/wishlist/delete", method = RequestMethod.POST)
	public String deleteWishlist(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		/* 선언부 */
		log.info("[Ajax] deleteWishlist" + jsMap.get("pd_seq"));
		
		return "1";
	}
	
}
