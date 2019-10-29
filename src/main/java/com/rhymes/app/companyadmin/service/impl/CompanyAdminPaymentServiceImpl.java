package com.rhymes.app.companyadmin.service.impl;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.companyadmin.dao.CompanyAdminPaymentDAO;
import com.rhymes.app.companyadmin.model.AdminPaymentVbankDTO;
import com.rhymes.app.companyadmin.service.CompanyAdminPaymentService;
import com.rhymes.app.payment.model.DeliveryDTO;
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
	public List<PaymentDTO> getOrderSuccessCount(AdminPaymentParam param) {
		return com_admin_paymentDAO.getOrderSuccessCount(param);
	}

	// 마켓명
	@Override
	public String getMarketName(String userid) {
		return com_admin_paymentDAO.getMarketName(userid);
	}

	// 내 업체만 주문상세내역 조회
	@Override
	public List<AdminPaymentDetailDTO> getOrderDetail(PaymentDTO dto) {
		return com_admin_paymentDAO.getOrderDetail(dto);
	}

	// 업체별 무통장입금 관리
	@Override
	public List<AdminPaymentVbankDTO> getVbankList(String userid) {
		return com_admin_paymentDAO.getVbankList(userid);
	}

	// 결제완료로 변경
	@Override
	public boolean paymentfinish(String seq) {
		return com_admin_paymentDAO.paymentfinish(seq);
	}

	// 배송관리
	@Override
	public List<DeliveryDTO> getDeliveryList(String userid) {
		return com_admin_paymentDAO.getDeliveryList(userid);
	}

	// 배송준비 중 -> 배송 중
	@Override
	public boolean getDeliveryIng(DeliveryDTO dto) {
		return com_admin_paymentDAO.getDeliveryIng(dto);
	}

	// 배송중 -> 배송완료
	@Override
	public boolean getDeliveryFinish(DeliveryDTO dto) {
		return com_admin_paymentDAO.getDeliveryFinish(dto);
	}
	

}
