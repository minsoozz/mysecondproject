package com.rhymes.app.member.dao;

import java.util.List;

public interface MypageReviewDAO {

	/**매개변수로 받은 유저ID가 갖고있는 모든 주문번호를 가져옴
	 * @param userid
	 * @return
	 */
	public List<String> getPaymentCodesByUserid(String userid);
}
