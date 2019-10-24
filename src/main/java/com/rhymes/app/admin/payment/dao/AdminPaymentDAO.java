package com.rhymes.app.admin.payment.dao;

import java.util.List;

import com.rhymes.app.payment.model.PaymentDTO;

public interface AdminPaymentDAO {

	// 관리자페이지 결제내역조회
	public List<PaymentDTO> getOrderSuccess();

}
