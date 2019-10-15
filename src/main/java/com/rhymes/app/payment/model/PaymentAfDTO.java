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
public class PaymentAfDTO implements Serializable {
	private String payment_code;			// 결제코드
	
	// 무통장입금
	private String bank_name;				// 은행명
	private String account_number;			// 계좌번호
	private String account_holder;			// 예금주
	private String deposit_limit;			// 입금기한
	
	// 카드
	//private String card_apply_num;			// 카드승인번호

}
