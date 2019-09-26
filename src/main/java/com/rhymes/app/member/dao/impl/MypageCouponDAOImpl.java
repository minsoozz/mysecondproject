package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypageCouponDAO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;

@Repository
public class MypageCouponDAOImpl implements MypageCouponDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "coupon.";
	
	/**검색조건에 맞는 유효한 쿠폰의 총 개수 리턴
	 * @return
	 */
	@Override
	public int getCountOnConditions(String userid) {
		// TODO Auto-generated method stub
		//return Integer.parseInt( sqlSession.selectMap(ns + "getCountOnConditions", userid).get("CNT") + "");
		return sqlSession.selectOne(ns + "getCountOnConditions", userid);
	}

	/**검색조건에 맞는 쿠폰 디테일 정보 리턴
	 * @return
	 */
	@Override
	public List<MemberCouponDTO> getDetailsOnConditions(PointsPagingDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getDetailsOnConditions", dto);
	}
}
