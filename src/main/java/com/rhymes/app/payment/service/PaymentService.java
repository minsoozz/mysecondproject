package com.rhymes.app.payment.service;

import java.util.List;

import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.model.OrderDTO;

public interface PaymentService {
	
	// 결제페이지에서 상품정보 가져오기
	public OrderDTO getOrder(OrderDTO dto);
	
	// 결제페이지에서 적립금 가져오기
	public int getPoint(String userid);
	
	// 결제페이지에서 쿠폰 개수 가져오기
	public int getCountCoupon(String userid);
	
	// 결제페이지에서 쿠폰 가져오기
	public List<MemberCouponDTO> getAllCoupon(String userid);

}
