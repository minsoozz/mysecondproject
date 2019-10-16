package com.rhymes.app.payment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDAO PaymentDao;

	// 결제페이지에서 상품정보 가져오기
	@Override
	public OrderDTO getOrder(OrderDTO dto) {
		return PaymentDao.getOrder(dto);
	}

	// 결제페이지에서 적립금 가져오기
	@Override
	public int getPoint(String userid) {
		return PaymentDao.getPoint(userid);
	}

	// 결제페이지에서 쿠폰 개수 가져오기
	@Override
	public int getCountCoupon(String userid) {
		return PaymentDao.getCountCoupon(userid);
	}

	// 결제페이지에서 쿠폰 세부사항 가져오기
	@Override
	public List<MemberCouponDTO> getAllCoupon(String userid) {
		return PaymentDao.getAllCoupon(userid);
	}

	// 결제한 후 상품 수량 차감
	@Override
	public boolean disc_stock_quantity(String stock_seq, String quantity) {
		return PaymentDao.disc_stock_quantity(stock_seq, quantity);
	}

	// 결제한 후 사용 포인트 차감
	@Override
	public boolean disc_point(PaymentDTO dto) {
		return PaymentDao.disc_point(dto);
	}

	// 결제 내역 저장
	@Override
	public boolean payment_save(PaymentDTO dto) {
		return PaymentDao.payment_save(dto);
	}
	
	// 결제시 사용한 쿠폰을 사용으로 변환
	@Override
	public boolean update_isused_coupon(PaymentDTO dto) {
		return PaymentDao.update_isused_coupon(dto);
	}
	
	// 결제 후 배송 내역 저장
	@Override
	public boolean delivery_save(PaymentDTO dto) {
		return PaymentDao.delivery_save(dto);
	}

}
