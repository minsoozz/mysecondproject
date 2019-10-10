package com.rhymes.app.payment.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSession SqlSession;
	private String p = "payment.";

	// 결제페이지에서 상품정보 가져오기
	@Override
	public OrderDTO getOrder(OrderDTO dto) {
		
		OrderDTO order = SqlSession.selectOne(p + "getOrder", dto);
		
		return order;
	}

	// 결제페이지에서 적립금 가져오기
	@Override
	public int getPoint(String userid) {

		int point = 0;
		try {
			point = SqlSession.selectOne(p + "getPoint", userid);
		}catch (Exception e) {	}
		 
		
		System.out.println("PaymentDAOIMPL point : " + point);
		
		return point;
	}
	
	// 결제페이지에서 사용자의 유효 쿠폰 개수 가져오기
	@Override
	public int getCountCoupon(String userid) {

		System.out.println("PaymentDAOIMPL userid : " + userid);
		
		int countCoupon = SqlSession.selectOne(p + "getCountCoupon", userid);
		
		System.out.println("PaymentDAOIMPL countCoupon : " + countCoupon);

		return countCoupon;
	}
	

	// 결제페이지에서 쿠폰세부정보 가져오기
	@Override
	public List<MemberCouponDTO> getAllCoupon(String userid) {
		
		List<MemberCouponDTO> coupon = new ArrayList<MemberCouponDTO>();
		
		coupon = SqlSession.selectList(p + "getAllCoupon", userid);
		int countCoupon = SqlSession.selectOne(p + "getCountCoupon", userid);
		
		System.out.println("PaymentDAOIMPL 쿠폰 개수 : " + countCoupon);

		for (MemberCouponDTO dto : coupon) {
			System.out.println("PaymentDAOIMPL 쿠폰 정보 : " + dto.toString());
		}
		
		return coupon;
	}

}
