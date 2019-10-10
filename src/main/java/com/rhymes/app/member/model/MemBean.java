package com.rhymes.app.member.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
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
	
	public MemBean() {}

	public MemBean(String userid, String userpw, Date rdate, int seq, boolean isAccountNonExpired,
			boolean isAccountNonLocked, boolean isCredentialsNonExpired, boolean isEnabled, String username,
			String postcode, String address, String detailAddress, String phone, String useremail, String gender,
			String birth, int count, String authority) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.rdate = rdate;
		this.seq = seq;
		this.isAccountNonExpired = isAccountNonExpired;
		this.isAccountNonLocked = isAccountNonLocked;
		this.isCredentialsNonExpired = isCredentialsNonExpired;
		this.isEnabled = isEnabled;
		this.username = username;
		this.postcode = postcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.phone = phone;
		this.useremail = useremail;
		this.gender = gender;
		this.birth = birth;
		this.count = count;
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "MemBean [userid=" + userid + ", userpw=" + userpw + ", rdate=" + rdate + ", seq=" + seq
				+ ", isAccountNonExpired=" + isAccountNonExpired + ", isAccountNonLocked=" + isAccountNonLocked
				+ ", isCredentialsNonExpired=" + isCredentialsNonExpired + ", isEnabled=" + isEnabled + ", username="
				+ username + ", postcode=" + postcode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", phone=" + phone + ", useremail=" + useremail + ", gender=" + gender + ", birth=" + birth
				+ ", count=" + count + ", authority=" + authority + "]";
	}

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
