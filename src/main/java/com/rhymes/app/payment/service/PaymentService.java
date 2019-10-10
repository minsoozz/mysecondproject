package com.rhymes.app.payment.service;

import java.util.List;

import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface PaymentService {
	
	// 주문페이지에서 상품정보 가져오기
	public OrderDTO getOrder(OrderDTO dto);
	
	// 주문페이지에서 적립금 가져오기
	public int getPoint(String id);
	
	// 주문페이지에서 쿠폰 가져오기
	public String getCoupon(String id);

}
