package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberOrderDTO {

	private int rnum;
	private String payment_code;
	private String userid;
	private int count;
	private String p_name;
	private int totalprice;
	private String payment_status;
	private String rdate;
}
