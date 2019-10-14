package com.rhymes.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

	/**위시리스트 페이지를 보여주는 메소드
	 * @return
	 */
	@GetMapping(value = "/wishlist")
	public String showWishList() {
		log.info("show wishlist");
		return "member/mypage/wishlist";
	}
	
	
}
