package com.rhymes.app.companyadmin.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.companyadmin.model.AdminPaymentVbankDTO;
import com.rhymes.app.companyadmin.service.CompanyAdminPaymentService;
import com.rhymes.app.payment.model.DeliveryDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/admin/company/payment")
@Controller
public class CompanyAdminPaymentController {

	@Autowired
	CompanyAdminPaymentService com_admin_paymentService;
	
	// 업체별 주문내역조회
	@GetMapping("/success")
	public String success(Model model, AdminPaymentParam param, Principal pcp) {
		//페이징
		// 클릭한 페이지
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20 30
		
		param.setStart(start);
		param.setEnd(end);
		param.setUserid(pcp.getName());
		
		// list
		List<PaymentDTO> orderSuccessList = com_admin_paymentService.getOrderSuccessList(param);
		// list 총 개수
		List<PaymentDTO> totalRecordCount = com_admin_paymentService.getOrderSuccessCount(param);
		// 마켓명
		String market = com_admin_paymentService.getMarketName(pcp.getName());

		// list 총 개수와 클릭한 페이지를 set
		param.setTotalRecordCount(totalRecordCount.size());
		param.setPageNumber(sn);

		model.addAttribute("orderSuccessList", orderSuccessList);
		model.addAttribute("param", param);
		model.addAttribute("market", market);
		
		return "company/success";
	}
	
	// 업체별 주문상세내역 조회
	@GetMapping("/detail")
	public String detail(Model model, Principal pcp, PaymentDTO dto) {
		dto.setUserid(pcp.getName());
		List<AdminPaymentDetailDTO> orderDetail = com_admin_paymentService.getOrderDetail(dto);
		// 마켓명
		String market = com_admin_paymentService.getMarketName(pcp.getName());
		model.addAttribute("orderDetail",orderDetail);
		model.addAttribute("market",market);
		return "company/detail";
	}
	
	// 업체별 무통장입금 관리
	@GetMapping("/vbank")
	public String vbank(Model model, Principal pcp, PaymentDTO dto) {		
		// 마켓명
		String market = com_admin_paymentService.getMarketName(pcp.getName());
		// list
		List<AdminPaymentVbankDTO> vbanklist = com_admin_paymentService.getVbankList(pcp.getName());
		
		model.addAttribute("vbanklist",vbanklist);
		model.addAttribute("market", market);
		
		return "company/vbank";
	}
	
	// 무통장 입금 미결제 -> 결제완료, 추가 적립금 저장
	@GetMapping("/vbank/finish")
	public String vbankfinish(Model model, Principal pcp, HttpServletRequest req, PaymentDTO dto) {
		log.warn("dto : " + dto.toString());
		String[] seq = req.getParameterValues("seq");
		for (int i = 0; i < seq.length; i++) {
			// 결제완료로 변경
			boolean b = com_admin_paymentService.paymentfinish(seq[i]);
			// 추가 적립금 저장
			boolean b1 = com_admin_paymentService.add_point(dto);
		}
		// 마켓명
		String market = com_admin_paymentService.getMarketName(pcp.getName());
		// list
		List<AdminPaymentVbankDTO> vbanklist = com_admin_paymentService.getVbankList(pcp.getName());

		model.addAttribute("vbanklist",vbanklist);
		model.addAttribute("market", market);
		
		return "company/vbank";
	}
	
	// 배송관리
	@GetMapping("/delivery")
	public String delivery(Model model, Principal pcp) {
		// 마켓명
		String market = com_admin_paymentService.getMarketName(pcp.getName());
		// list
		List<DeliveryDTO> deliverylist = com_admin_paymentService.getDeliveryList(pcp.getName());

		model.addAttribute("deliverylist",deliverylist);
		model.addAttribute("market", market);
		return "company/delivery";
	}
	
	// 배송준비 중 -> 배송 중
	@GetMapping("/delivery/ing")
	public String deliverying(Model model, Principal pcp, DeliveryDTO dto) {
		// 배송준비 중 -> 배송 중
		boolean b = com_admin_paymentService.getDeliveryIng(dto);
		// 마켓명
		String market = com_admin_paymentService.getMarketName(pcp.getName());
		// list
		List<DeliveryDTO> deliverylist = com_admin_paymentService.getDeliveryList(pcp.getName());
		
		model.addAttribute("deliverylist",deliverylist);
		model.addAttribute("market", market);
		return "company/delivery";
	}
	
	// 배송중 -> 배송완료
	@GetMapping("/delivery/finish")
	public String deliveryfinish(Model model, Principal pcp, DeliveryDTO dto) {
		// 배송중 -> 배송완료
		boolean b = com_admin_paymentService.getDeliveryFinish(dto);
		// 마켓명
		String market = com_admin_paymentService.getMarketName(pcp.getName());
		// list
		List<DeliveryDTO> deliverylist = com_admin_paymentService.getDeliveryList(pcp.getName());

		model.addAttribute("deliverylist",deliverylist);
		model.addAttribute("market", market);
		return "company/delivery";
	}
	
}



