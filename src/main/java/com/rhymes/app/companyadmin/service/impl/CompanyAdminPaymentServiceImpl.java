package com.rhymes.app.companyadmin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.companyadmin.dao.CompanyAdminPaymentDAO;
import com.rhymes.app.companyadmin.service.CompanyAdminPaymentService;
import com.rhymes.app.payment.model.PaymentDTO;

@Service
public class CompanyAdminPaymentServiceImpl implements CompanyAdminPaymentService {

	@Autowired
	CompanyAdminPaymentDAO com_admin_paymentDAO;
	
	// 주문내역
	@Override
	public List<PaymentDTO> getOrderSuccessList(AdminPaymentParam param) {
		return com_admin_paymentDAO.getOrderSuccessList(param);
	}

	// 주문내역 총 개수
	@Override
	public int getOrderSuccessCount(AdminPaymentParam param) {
		return com_admin_paymentDAO.getOrderSuccessCount(param);
	}

}
