package com.rhymes.app.payment.dao;

import java.util.List;

import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface PaymentDAO {
	
	// 결제페이지에서 상품정보 가져오기
	public OrderDTO getOrder(OrderDTO dto);
	
	// 결제페이지에서 적립금 가져오기
	public int getPoint(String userid);
	
	// 결제페이지에서 쿠폰 개수 가져오기
	public int getCountCoupon(String userid);
	
	// 결제페이지에서 쿠폰 세부사항 가져오기
	public List<MemberCouponDTO> getAllCoupon(String userid);
	
	// 결제한 후 상품 수량 차감
	public boolean disc_stock_quantity(String stock_seq, String quantity);

	// 결제한 후 사용 포인트 차감
	public boolean disc_point(PaymentDTO dto);

	// 결제 내역 저장
	public boolean payment_save(PaymentDTO dto);
	
	// 결제시 사용한 쿠폰 삭제
	public boolean delete_coupon_code(PaymentDTO dto);
	
	
}
