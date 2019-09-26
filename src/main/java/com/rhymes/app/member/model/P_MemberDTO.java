package com.rhymes.app.member.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class P_MemberDTO implements Serializable {

   private String userid;      // 아이디
   private String username;      // 이름

   private String postcode;      // 우편번호
   private String address;         // 주소
   private String detailAddress;   // 상세주소
   
   private String phone;
   private String useremail;      // 이메일
   private String usergender;      // 성별
   private String userbirth;      // 생일
   private int count;         // 인증횟수
   
   
   public P_MemberDTO() {}


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


   @Override
   public String toString() {
      return "P_MemberDTO [userid=" + userid + ", username=" + username + ", postcode=" + postcode + ", address="
            + address + ", detailAddress=" + detailAddress + ", phone=" + phone + ", useremail=" + useremail
            + ", usergender=" + usergender + ", userbirth=" + userbirth + ", count=" + count + "]";
   }













   
   
   
   
}