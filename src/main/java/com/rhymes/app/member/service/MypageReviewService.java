package com.rhymes.app.member.service;

import java.util.List;
import java.util.Map;

import com.rhymes.app.member.model.mypage.MemberOrderDetailDTO;

public interface MypageReviewService {

	/**매개변수로 받은 유저ID가 갖고있는 모든 주문번호를 가져옴
	 * @param userid
	 * @return
	 */
	public List<String> getPaymentCodesByUserid(String userid);
	
	/**리뷰 작성 여부에 따라 Map에 저장
	 * key:true, value:리뷰가작성된 주문이력 Map
	 * key:false, value:리뷰가 작성되지 않은 주문이력 Map
	 * 
	 * 주문이력 Map
	 * key:주문번호, value: 디테일
	 * @param userid
	 * @return
	 */
	public Map<Boolean, Map<String, List<MemberOrderDetailDTO>>> getTwoMapsSeperatedByWhetherReviewWritten(List<String> payment_codes);
}
