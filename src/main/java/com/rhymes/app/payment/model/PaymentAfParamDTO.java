package com.rhymes.app.payment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PaymentAfParamDTO implements Serializable {
	private String basket_seq;				// 장바구니 코드
	
	private int totalprice;					// 결제금액
	private String payment_code;			// 결제코드
	private String payment_method;			// 결제수단
	private String payment_status;			// 결제상태
	
	private String name;					// 수취인 이름
	private String phone;					// 배송지 연락처
	private String postcode;				// 배송지 우편번호
	private String address;					// 배송지 주소
	private String address_request;			// 배송시 요청사항
	
	private int point;						// 적립금

	// 무통장입금
	private String bank_id;					// 은행명
	private String bank_code;				// 계좌번호
	private String bank_name;				// 예금주
	private String bank_date;				// 입금기한
	
	// 카드결제, 휴대폰 소액결제, 카카오페이
	//private 

}
