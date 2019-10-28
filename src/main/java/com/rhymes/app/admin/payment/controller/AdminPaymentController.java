package com.rhymes.app.admin.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.admin.payment.service.AdminPaymentService;
import com.rhymes.app.payment.model.PaymentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/payment")
public class AdminPaymentController {
	
	@Autowired
	private AdminPaymentService adminPaymentService;
	
	// 관리자페이지 결제내역조회
	@RequestMapping("/success")
	public String success(Model model, AdminPaymentParam param) {
		//페이징
		// 클릭한 페이지
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20 30
		
		param.setStart(start);
		param.setEnd(end);
		
		// DB
		List<PaymentDTO> orderSuccessList = adminPaymentService.getOrderSuccessList(param);
		// list 총 개수
		int totalRecordCount = adminPaymentService.getOrderSuccessCount(param);

		// list
		model.addAttribute("orderSuccessList", orderSuccessList);
		
		// 클릭한 페이지 수
		model.addAttribute("pageNumber", sn);
		// 한 페이지당 데이터 개수
		model.addAttribute("pageCountPerScreen", 3);
		// 한 페이지당 글 수
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		// list 총 개수
		model.addAttribute("totalRecordCount", totalRecordCount);

		// 검색한 카테고리
		model.addAttribute("s_category",param.getS_category());
		// 검색한 키워드
		model.addAttribute("s_keyword",param.getS_keyword());
		
		return "success";
	} 
	
	// 관리자페이지 결제상상세내역조회
	@RequestMapping("/detail")
	public String detail(Model model, PaymentDTO dto) {
		List<AdminPaymentDetailDTO> orderDetail = adminPaymentService.getOrderDetail(dto);
		model.addAttribute("orderDetail",orderDetail);
		return "detail";
	}
	
	// 관리자 페이지 교환관리
	@RequestMapping("/exchange")
	public String exchange() {
		log.warn("AdminPaymentController exchange()");
		return "exchange";
	}

//	// 관리자 페이지 환불관리
//	@RequestMapping("/admin/payment/refund")
//	public String refund() {
//		log.warn("AdminPaymentController refund()");
//		
//		return "/refund";
//	}
	
	// 관리자 페이지 무통장 주문 취소관리, 환불관리
	@RequestMapping("/cancel")
	public String cancel() {
		System.out.println("AdminPaymentController cancel()");
		
		return "cancel";
	}
	
//	// 관리자 페이지 결제완료관리
//	@RequestMapping("/admin/payment/finish")
//	public String finish() {
//		log.warn("AdminPaymentController finish()");
//		
//		return "/finish";
//	}
	
}
