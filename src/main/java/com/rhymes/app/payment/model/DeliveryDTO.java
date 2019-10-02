package com.rhymes.app.payment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryDTO implements Serializable {
	private int payment_code;			// 결제번호
	private String name;				// 주문자 이름
	private String delivery_status;		// 배송상태
	private String delivery_post_code;	// 운송장번호
	private String edate;				// 배송완료일
}
