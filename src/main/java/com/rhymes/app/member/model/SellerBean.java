package com.rhymes.app.member.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellerBean implements Serializable {
	
	// 공통정보
	private int seq;
	private String userid;
	private String userpw;
	
	private boolean isAccountNonExpired = true;
	private boolean isAccountNonLock = true;
	private boolean isCredentialsIsNonExpired = true;	
	private boolean enabled;
	private List<AuthoritiesDTO> authList;
	private Date rdate;
	
	// 추가정보
//	private String id;				// 아이디
	private String c_name;			// 상호
	private String c_num;			// 사업자등록번호
	private String p_name;			// 대표자명
	private String c_postcode;		// 회사우편번호
	private String c_address;		// 회사 주소
	private String c_detailAddress;	// 회사 상세주소
	private String c_cond;			// 업태
	private String c_type;			// 종목
	private String ic_name;			// 담당자이름
	private String to;				// 담당자번호
	private String ic_email;		// 담당자이메일
	private String s_postcode;		// 출고지 우편번호
	private String s_address;		// 출고지 주소
	private String s_detailAddress;	// 출고지 상세주소		
	private String r_postcode;		// 반품/교환 우편번호
	private String r_address;		// 반품/교환 주소
	private String r_detailAddress;	// 반품/교환 상세주소
	private int c_code;				// 고유번호(seq)

	// AuthoritiesDto
	private String authority;	// 권한
	
	// 사업자 번호
	private String crnum1;
	private String crnum2;
	private String crnum3;
	
	
	
	// 이메일 합치기
	private String ic_email1;
	private String ic_email2;
	
	

	
	public SellerBean() {}

	public String cnum() {	
		c_num = crnum1+"-"+crnum2+"-"+crnum3;		
		System.out.println("SellerBeanDTO   c_num: " + c_num);
		return c_num;
	}
	
	public String Memail() {
		ic_email = ic_email1+"@"+ic_email2;
		System.out.println("SellerBeanDTO   ic_email: " + ic_email);
		return ic_email; 
	}


	
	public SellerBean(int seq, String userid, String userpw, boolean isAccountNonExpired, boolean isAccountNonLock,
			boolean isCredentialsIsNonExpired, boolean enabled, List<AuthoritiesDTO> authList, Date rdate) {
		super();
		this.seq = seq;
		this.userid = userid;
		this.userpw = userpw;
		this.isAccountNonExpired = isAccountNonExpired;
		this.isAccountNonLock = isAccountNonLock;
		this.isCredentialsIsNonExpired = isCredentialsIsNonExpired;
		this.enabled = enabled;
		this.authList = authList;
		this.rdate = rdate;
	}

	public SellerBean(int seq, String userid, String userpw, boolean isAccountNonExpired, boolean isAccountNonLock,
			boolean isCredentialsIsNonExpired, boolean enabled, List<AuthoritiesDTO> authList, Date rdate,
			String c_name, String c_num, String p_name, String c_postcode, String c_address, String c_detailAddress,
			String c_cond, String c_type, String ic_name, String to, String ic_email, String s_postcode,
			String s_address, String s_detailAddress, String r_postcode, String r_address, String r_detailAddress,
			int c_code, String authority, String crnum1, String crnum2, String crnum3, String ic_email1,
			String ic_email2) {
		super();
		this.seq = seq;
		this.userid = userid;
		this.userpw = userpw;
		this.isAccountNonExpired = isAccountNonExpired;
		this.isAccountNonLock = isAccountNonLock;
		this.isCredentialsIsNonExpired = isCredentialsIsNonExpired;
		this.enabled = enabled;
		this.authList = authList;
		this.rdate = rdate;
		this.c_name = c_name;
		this.c_num = c_num;
		this.p_name = p_name;
		this.c_postcode = c_postcode;
		this.c_address = c_address;
		this.c_detailAddress = c_detailAddress;
		this.c_cond = c_cond;
		this.c_type = c_type;
		this.ic_name = ic_name;
		this.to = to;
		this.ic_email = ic_email;
		this.s_postcode = s_postcode;
		this.s_address = s_address;
		this.s_detailAddress = s_detailAddress;
		this.r_postcode = r_postcode;
		this.r_address = r_address;
		this.r_detailAddress = r_detailAddress;
		this.c_code = c_code;
		this.authority = authority;
		this.crnum1 = crnum1;
		this.crnum2 = crnum2;
		this.crnum3 = crnum3;
		this.ic_email1 = ic_email1;
		this.ic_email2 = ic_email2;
	}

	@Override
	public String toString() {
		return "SellerBean [seq=" + seq + ", userid=" + userid + ", userpw=" + userpw + ", isAccountNonExpired="
				+ isAccountNonExpired + ", isAccountNonLock=" + isAccountNonLock + ", isCredentialsIsNonExpired="
				+ isCredentialsIsNonExpired + ", enabled=" + enabled + ", authList=" + authList + ", rdate=" + rdate
				+ ", c_name=" + c_name + ", c_num=" + c_num + ", p_name=" + p_name + ", c_postcode=" + c_postcode
				+ ", c_address=" + c_address + ", c_detailAddress=" + c_detailAddress + ", c_cond=" + c_cond
				+ ", c_type=" + c_type + ", ic_name=" + ic_name + ", to=" + to + ", ic_email=" + ic_email
				+ ", s_postcode=" + s_postcode + ", s_address=" + s_address + ", s_detailAddress=" + s_detailAddress
				+ ", r_postcode=" + r_postcode + ", r_address=" + r_address + ", r_detailAddress=" + r_detailAddress
				+ ", c_code=" + c_code + ", authority=" + authority + ", crnum1=" + crnum1 + ", crnum2=" + crnum2
				+ ", crnum3=" + crnum3 + ", ic_email1=" + ic_email1 + ", ic_email2=" + ic_email2 + "]";
	}

	





	
	
	
	
	
	
}
