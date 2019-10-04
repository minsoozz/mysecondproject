package com.rhymes.app.payment.service;

import java.util.List;

import com.rhymes.app.payment.model.PaymentDTO;

public interface OrdercheckService {
	
	// 주문조회페이지에서 주문내역 조회
	public List<PaymentDTO> getOrdercheck();

}
