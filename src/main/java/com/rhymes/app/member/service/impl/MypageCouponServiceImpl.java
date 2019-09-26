package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.MypageCouponDAO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.service.MypageCouponService;

@Service
public class MypageCouponServiceImpl implements MypageCouponService {

	@Autowired
	private MypageCouponDAO mypageCouponDAO;
		
	/**검색조건에 맞는 유효한 쿠폰의 총 개수 리턴
	 * @return
	 */
	@Override
	public int getCountOnConditions(String userid) {
		// TODO Auto-generated method stub
		return mypageCouponDAO.getCountOnConditions(userid);
	}

	/**검색조건에 맞는 쿠폰 디테일 정보 리턴
	 * @return
	 */
	@Override
	public List<MemberCouponDTO> getDetailsOnConditions(PointsPagingDTO dto) {
		// TODO Auto-generated method stub
		return mypageCouponDAO.getDetailsOnConditions(dto);
	}

}
