package com.rhymes.app.payment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoMemOrderCheckDTO implements Serializable {
	private String payment_code;
	private String send_name;
	private String rdate;
	
	private String name;
	private String delivery_post_code;
	private String receive_phone;
	private String receive_address;
	private String delivery_request;
	
	private int s_seq;
	private int ea;
	private String size;
	private String p_color;
	private int price;
	private String payment_status;
	
	private String payment_method;
	private int totalprice;

	private String p_name;
	private String p_title;
	private String photo1_file;	
	
}
