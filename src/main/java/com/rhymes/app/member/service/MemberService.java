package com.rhymes.app.member.service;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;

public interface MemberService{
	
	// 아이디 체크
	public int getIDCheck(MemberDTO mem);
	
	// 회원가입 insert
	public void getAddmem(MemBean bean);
	
	/*
	Collection<GrantedAuthority> getAuthorities(String username);
    public User readUser(String username);
    public void createUser(User user);
    public void deleteUser(String username);
	*/
	
}
