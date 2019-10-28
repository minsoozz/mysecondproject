package com.rhymes.app.companyadmin.service;

import java.util.List;

import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.payment.model.PaymentDTO;

public interface CompanyAdminPaymentService {
	
	// 주문내역
	public List<PaymentDTO> getOrderSuccessList(AdminPaymentParam param);

	// 주문내역 총 개수
	public int getOrderSuccessCount(AdminPaymentParam param);

}
