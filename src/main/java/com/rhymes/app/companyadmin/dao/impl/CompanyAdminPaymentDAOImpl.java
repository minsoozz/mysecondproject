package com.rhymes.app.companyadmin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.companyadmin.dao.CompanyAdminPaymentDAO;
import com.rhymes.app.payment.model.PaymentDTO;

@Repository
public class CompanyAdminPaymentDAOImpl implements CompanyAdminPaymentDAO {

	@Autowired
	SqlSession SqlSession;
	String ns = "adminCompanyPayment.";
	
	// 주문내역
	@Override
	public List<PaymentDTO> getOrderSuccessList(AdminPaymentParam param) {
		return SqlSession.selectList(ns + "getOrderSuccessList", param);
	}

	// 주문내역 총 개수
	@Override
	public int getOrderSuccessCount(AdminPaymentParam param) {
		return SqlSession.selectOne(ns + "getOrderSuccessCount", param);
	}

}
