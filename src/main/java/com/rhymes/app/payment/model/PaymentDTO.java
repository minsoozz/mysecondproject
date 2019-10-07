package com.rhymes.app.payment.model;

/*
CREATE TABLE rhy_payment (
	SEQ INT,							// 시퀀스
	PAYMENT_CODE INT PRIMARY KEY,		// 결제번호
	SEND_NAME VARCHAR(10),				// 보내는 이
	SEND_PHONE VARCHAR(13),				// 보내는 이 번호
	SEND_EMAIL VARCHAR(40),				// 보내는 이 이메일
	RECEIVE_NAME VARCHAR(10),			// 받는 이
	RECEIVE_PHONE VARCHAR(13),			// 받는 이 번호
	RECEIVE_ADDRESS VARCHAR(50),		// 받는 이 주소
	DELIVERY_REQUEST VARCHAR(50),		// 배송 요청사항
	PAYMENT_METHOD VARCHAR(10),			// 결제수단
	PAYMENT_DETAIL_METHOD VARCHAR(10),	// 결제상세수단
	PAYMENT_STATUS VARCHAR(10),			// 결제상태
	PRODUCT_PRICE INT,					// 상품금액
	DELIVERY_PRICE INT,					// 배송비
	COUPON VARCHAR(20),					// 쿠폰
	POINT_PRICE INT,					// 적립금
	TOTALPRICE INT,						// 총금액
	RDARE DATETIME						// 주문날짜
)
*/

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO implements Serializable {
	private int seq;						// 시퀀스
	private String payment_code;			// 결제번호
	private String send_name;				// 보내는 이 이름
	private String send_phone;				// 보내는 이 번호
	private String send_email;				// 보내는 이 이메일
	private String receive_name;			// 받는 이 이름
	private String receive_phone;			// 받는 이 번호
	private String receive_address;			// 받는 이 주소
	private String delivery_request;		// 배송요청사항
	private String payment_method;			// 결제수단
	private String payment_detail_method;	// 결제상세수단
	private String payment_status;			// 결제상태
	private int product_price;				// 상품금액
	private int delivery_price;				// 배송비
	private int coupon;						// 쿠폰
	private int point_price;				// 적립금
	private int totalprice;					// 총금액
	private Date rdate;						// 주문날짜
}
