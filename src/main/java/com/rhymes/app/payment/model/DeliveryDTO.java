package com.rhymes.app.payment.model;

/*
CREATE TABLE rhy_delivery (
	PAYMENT_CODE INT PRIMARY KEY,		// 결제번호
	NAME VARCHAR(10),					// 주문자 이름
	DELIVERY_STATUS VARCHAR(20),		// 배송상태
	DELIVERY_POST_CODE VARCHAR(20),		// 운송장번호
	EDATE VARCHAR(20)					// 배송완료일
)
*/

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
	private String payment_code;		// 결제번호
	private String name;				// 주문자 이름
	private String delivery_status;		// 배송상태
	private String delivery_post_code;	// 운송장번호
	private String edate;				// 배송완료일
}
