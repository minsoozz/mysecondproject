package com.rhymes.app.payment.model;

import java.io.Serializable;
import java.util.Date;

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
public class PaymentDetailsDTO implements Serializable {
	private int seq;			// id
	private int p_seq;			// 상품고유번호
	private int price;			// 상품결제가격
	private int payment_code;	// 결제코드
	private Date rdate;			// 결제일
}
