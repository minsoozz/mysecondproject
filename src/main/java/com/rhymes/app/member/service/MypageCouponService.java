package com.rhymes.app.member.service;

import java.util.List;

import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;

public interface MypageCouponService {
		
	/**검색조건에 맞는 유효한 쿠폰의 총 개수 리턴
	 * @return
	 */
	public int getCountOnConditions(String userid);
	
	/**검색조건에 맞는 쿠폰 디테일 정보 리턴
	 * @return
	 */
	public List<MemberCouponDTO> getDetailsOnConditions(PointsPagingDTO dto);
	
}
