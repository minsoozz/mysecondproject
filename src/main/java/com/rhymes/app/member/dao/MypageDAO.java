package com.rhymes.app.member.dao;

import com.rhymes.app.member.model.MemberPointDTO;
import com.rhymes.app.member.model.PointsPagingDTO;

public interface MypageDAO {

	
	/**검색조건에 맞는 적립금 디테일의 총 개수 리턴 
	 * @param userid
	 * @return
	 */
	public int getCountOnConditions(String userid); 

	/**검색조건에 맞는 적립금 디테일 정보 리턴
	 * @param dto
	 * @return
	 */
	public MemberPointDTO getDetailsOnConditions(PointsPagingDTO dto);
	
	
	
//		"
//				+ "getDetailsById"
//				+ "getAmountOfPointById"
//				+ "getAmountOfExpiredPointById
	
}
