package com.rhymes.app.payment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;
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

}
