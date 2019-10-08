package com.rhymes.app.payment.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.payment.model.DeliveryDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.service.OrdercheckService;

@Controller
public class OrdercheckController {
	
	@Autowired
	private OrdercheckService OrdercheckService;
	
	// 비회원 주문조회 인증 페이지로 이동
	@RequestMapping("/ordercheck_nomembership_confirm_move")
	public String ordercheck_confirm_move() {
		System.out.println("darae ordercheck_confirm_move");
		
		return "/order_nomembership_confirm";
	}
	
	// 주문조회 페이지로 이동
	@ResponseBody
	@RequestMapping("/ordercheck_nomembership_confirm")
	public String ordercheck_confirm(Model model, String name, String code) {
		System.out.println("darae ordercheck_confirm");
		
		// 주문번호, 이름 맞는지 확인
		boolean b = OrdercheckService.confirm(code, name);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	}
	
	// 주문상세내역 페이지로 이동
	@RequestMapping("/ordercheck_detail_move")
	public String ordercheck_detail_move(Model model, String payment_code) {
		System.out.println("darae ordercheck_move");
		
		List<PaymentDTO> order_detail_list = new ArrayList<PaymentDTO>();
		
		// 주문상세내역 가져오기
		order_detail_list = OrdercheckService.getOrdercheckDetail(payment_code);
		model.addAttribute("order_detail_list", order_detail_list);
		
		for(PaymentDTO p : order_detail_list) {
			//System.out.println("p : " + p);
		}
		
		return "/order_detail_move";
	}
	
	// 회원일때 주문내역 확인 페이지로 이동
	@RequestMapping("/ordercheck_move")
	public String ordercheck_move(Model model) {
		System.out.println("darae ordercheck_move");

		List<PaymentDTO> order_list = new ArrayList<PaymentDTO>();
		
		// 주문내역 가져오기
		order_list = OrdercheckService.getOrdercheck();
		model.addAttribute("order_list", order_list);
		
		for(PaymentDTO p : order_list) {
			//System.out.println("p : " + p);
		}
		
		return "/order_move";
	}
	
	// 주문내역/배송조회 페이지에서 배송현황보기 팝업창
	@RequestMapping("/ordercheck_delivery_popup")
	public String ordercheck_delivery_popup(Model model, String payment_code) {
		System.out.println("darae ordercheck_delivery_popup");

		List<DeliveryDTO> order_delivery_list = new ArrayList<DeliveryDTO>();
		
		// 배송현황 가져오기
		order_delivery_list = OrdercheckService.getOrdercheckDelivery(payment_code);
		model.addAttribute("order_delivery_list", order_delivery_list);
		
		System.out.println("size : " + order_delivery_list.size());
		
		for(DeliveryDTO d : order_delivery_list) {
			System.out.println("d : " + d);
		}
		
		return "/order_delivery_popup";
	}

	// 주문내역/배송조회 페이지에서 상품후기쓰기로 이동
	@RequestMapping("/ordercheck_review_move")
	public String ordercheck_review_move(Model model, PaymentDTO dto) {
		System.out.println("darae ordercheck_review_move");
		System.out.println("payment_code : " + dto.getPayment_code());

		return "/order_review_move";
	}



}
