package com.rhymes.app.companyadmin.service;

import java.util.List;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.companyadmin.model.AdminPaymentVbankDTO;
import com.rhymes.app.payment.model.DeliveryDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface CompanyAdminPaymentService {
	
	// 주문내역
	public List<PaymentDTO> getOrderSuccessList(AdminPaymentParam param);

	// 주문내역 총 개수
	public List<PaymentDTO> getOrderSuccessCount(AdminPaymentParam param);
	
	// 마켓명
	public String getMarketName(String userid);
	
	// 주문상세내역
	public List<AdminPaymentDetailDTO> getOrderDetail(PaymentDTO dto);
	
	// 무통장입금 관리
	public List<AdminPaymentVbankDTO> getVbankList(String userid);
	
	// 결제완료로 변경
	public boolean paymentfinish(String seq);

	// 추가 적립금 저장
	public boolean add_point(PaymentDTO dto);

	// 배송관리
	public List<DeliveryDTO> getDeliveryList(String userid);
	
	// 배송준비 중 -> 배송 중
	public boolean getDeliveryIng(DeliveryDTO dto);
	
	// 배송중 -> 배송완료
	public boolean getDeliveryFinish(DeliveryDTO dto);

}
