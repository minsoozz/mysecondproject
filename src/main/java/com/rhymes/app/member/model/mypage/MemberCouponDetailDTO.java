package com.rhymes.app.member.model.mypage;

import java.io.Serializable;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
public class MemberCouponDetailDTO implements Serializable {
	
	private int seq;	//쿠폰디테일seq
	private int c_seq;	//쿠폰seq(FK)
	
	private String userid;	//발급받은 회원id
	private String gdate;	//발급일
	private String expdate;	//만료일
	
	private String coup_code;	//쿠폰고유코드
	private String isused;	//사용여부
	private String used_id;	//사용한id
	private String used_date;	//사용일
		
	@Builder
	public MemberCouponDetailDTO() { }

	@Builder
	public MemberCouponDetailDTO(int seq, int c_seq, String userid, String gdate, String expdate, String coup_code,
			String isused, String used_id, String used_date) {
		super();
		this.seq = seq;
		this.c_seq = c_seq;
		this.userid = userid;
		this.gdate = gdate;
		this.expdate = expdate;
		this.coup_code = coup_code;
		this.isused = isused;
		this.used_id = used_id;
		this.used_date = used_date;
	}
}
