package com.rhymes.app.member.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class P_MemberDTO implements Serializable {

	private String userid;		// 아이디
	private String username;		// 이름

	private String postcode;		// 우편번호
	private String address;			// 주소
	private String detailAddress;	// 상세주소
	
	private String phone;
	private String useremail;		// 이메일
	private String usergender;		// 성별
	private String userbirth;		// 생일
	private int count;			// 인증횟수
	
	private boolean islike;   // 중고 상품 , 각 게시글마다 좋아요 클릭 여부 확인..
	
	
	
	public P_MemberDTO() {}


   public P_MemberDTO(String userid, String username, String postcode, String address, String detailAddress,
         String phone, String useremail, String usergender, String userbirth, int count, boolean islike) {
      super();
      this.userid = userid;
      this.username = username;
      this.postcode = postcode;
      this.address = address;
      this.detailAddress = detailAddress;
      this.phone = phone;
      this.useremail = useremail;
      this.usergender = usergender;
      this.userbirth = userbirth;
      this.count = count;
      this.islike = islike;
   }

	   public P_MemberDTO(String userid, String username, String postcode, String address, String detailAddress,
	            String phone, String useremail, String usergender, String userbirth, int count) {
	         super();
	         this.userid = userid;
	         this.username = username;
	         this.postcode = postcode;
	         this.address = address;
	         this.detailAddress = detailAddress;
	         this.phone = phone;
	         this.useremail = useremail;
	         this.usergender = usergender;
	         this.userbirth = userbirth;
	         this.count = count;
	      }



		public P_MemberDTO(String useremail) {
			super();
			this.useremail = useremail;
		}
	
	

		public P_MemberDTO(String userid, String username, String useremail, String usergender, String userbirth) {
			super();
			this.userid = userid;
			this.username = username;
			this.useremail = useremail;
			this.usergender = usergender;
			this.userbirth = userbirth;
		}
	
	
		@Override
		public String toString() {
		   return "P_MemberDTO [userid=" + userid + ", username=" + username + ", postcode=" + postcode + ", address="
		         + address + ", detailAddress=" + detailAddress + ", phone=" + phone + ", useremail=" + useremail
		         + ", usergender=" + usergender + ", userbirth=" + userbirth + ", count=" + count + ", islike=" + islike
		         + "]";
		}





}
	
	
	
