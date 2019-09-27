package com.rhymes.app.member.model;

import java.io.Serializable;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Setter
@Getter
@ToString
public class MemberPointDTO implements Serializable {

	private int rnum;
	private int seq;
	private String userid;
	private String comment;
	private int amount;
	private String amountStr;
	private String rdate;
	private String edate;
	private String isExpired;
	
	public String getAmountStr() {
		String s = "";
		try {
			if( this.amount >= 0 ) {
				s += "+";
			}
			s += amount;
		}catch (Exception e) {
			s = "0";
		}
		return s;
	}
	
	@Builder
	public MemberPointDTO () { }

	@Builder
	public MemberPointDTO(int rnum, int seq, String userid, String comment, int amount, String rdate, String edate,
			String isExpired) {
		super();
		this.rnum = rnum;
		this.seq = seq;
		this.userid = userid;
		this.comment = comment;
		this.amount = amount;
		this.rdate = rdate;
		this.edate = edate;
		this.isExpired = isExpired;
	}
	
}
