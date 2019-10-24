package com.rhymes.app.admin.payment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AdminPaymentSuccessDTO implements Serializable {
	private String payment_code;
	private String userid;
	private String send_name;
	private String payment_method;
	
	private String vbank_name;
	private String vbank_num;
	private String vbank_holder;
	private String vbank_date;
	private String card_apply_num;
	
	private String payment_status;
	private String totalprice;
	private String rdate;

}
