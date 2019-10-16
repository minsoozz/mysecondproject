package com.rhymes.app.member.model;

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
@AllArgsConstructor
@NoArgsConstructor
public class MemBean implements Serializable {

	
	// MemberDto
	private String userid;		//아이디
	private String userpw;		// 비밀번호
	private Date rdate;		// 등록일
	private int seq;		// 고유번호
	private boolean isAccountNonExpired;		// 만료여부
	private boolean isAccountNonLocked;			// 잠김여부
	private boolean isCredentialsNonExpired;	// 만료여부
	private boolean isEnabled;					// 사용가능여부
	
	// P_MemberDto
	private String username;		// 이름
	private String postcode;		// 우편번호
	private String address;			// 주소
	private String detailAddress;	// 상세주소
	
	private String phone;			// 전화번호
	private String useremail;		// 이메일
	private String gender;		// 성별
	private String birth;		// 생일
	private int count;			// 인증횟수
	
	// AuthoritiesDto
	private String authority;	// 권한
	
	private String social;	// 소셜 로그인 구분
	
	// 


	public MemBean(String userid, String userpw, String username, String useremail, String authority, String social) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useremail = useremail;
		this.authority = authority;
		this.social = social;
	}
	
	/*
	public String getAddress() {
		
		// 우편번호 + 주소 + 상세주소 + 참고항목
		detailAddress = detailAddress + extraAddress;
		
		return detailAddress;
	}
	*/






	
	
	
}
