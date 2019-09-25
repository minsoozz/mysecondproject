package com.rhymes.app.member.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.userdetails.User;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;

public interface MemberService{
	
	// 아이디 체크
	public int getIDCheck(MemberDTO mem);
	
	// 일반회원가입 insert
	public void getAddmem(MemBean bean);
	
	// 사업자 회원가입 insert
	public void getAddseller(MemBean bean);
	
}
