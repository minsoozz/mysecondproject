package com.rhymes.app.member.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.userdetails.User;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;

public interface MemberService{
	
	// 아이디 체크
	public int getIDCheck(MemberDTO mem);
	
	// 일반회원가입 insert
	public void getAddmem(MemBean bean);
	
	// 사업자번호 체크
	public String getCRCheck(SellerCRnumDTO crdto);
	
	// 라임즈에 사업자번호 등록되어있는지 확인
	public int getCRCYN(SellerCRnumDTO crnum);
	
	// 사업자 회원가입 insert
	public void getAddSeller(SellerBean sellerbean, MemberDTO mem);
	
	
}
