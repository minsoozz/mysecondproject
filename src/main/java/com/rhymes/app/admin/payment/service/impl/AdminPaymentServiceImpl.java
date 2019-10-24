package com.rhymes.app.admin.payment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.payment.dao.AdminPaymentDAO;
import com.rhymes.app.admin.payment.service.AdminPaymentService;
import com.rhymes.app.payment.model.PaymentDTO;

@Service
public class AdminPaymentServiceImpl implements AdminPaymentService {
	
	@Autowired
	AdminPaymentDAO AdminPaymentDAO;

	// 관리자페이지 결제내역조회
	@Override
	public List<PaymentDTO> getOrderSuccess() {
		return AdminPaymentDAO.getOrderSuccess();
	}

}
