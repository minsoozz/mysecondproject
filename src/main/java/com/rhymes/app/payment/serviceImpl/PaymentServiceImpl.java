package com.rhymes.app.payment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDAO PaymentDao;

	// 주문페이지에서 상품정보 가져오기
	@Override
	public OrderDTO getOrder(OrderDTO dto) {
		return PaymentDao.getOrder(dto);
	}

	// 주문페이지에서 적립금 가져오기
	@Override
	public int getPoint(String id) {
		return PaymentDao.getPoint(id);
	}

	// 주문페이지에서 쿠폰 가져오기
	@Override
	public String getCoupon(String id) {
		return PaymentDao.getCoupon(id);
	}

}
