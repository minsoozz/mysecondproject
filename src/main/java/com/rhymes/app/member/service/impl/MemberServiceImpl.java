package com.rhymes.app.member.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rhymes.app.common.dao.CommonDAO;
import com.rhymes.app.member.dao.MemberDAO;
import com.rhymes.app.member.model.AuthoritiesDTO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberdao;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	// 아이디체크
	@Override
	public int getIDCheck(MemberDTO mem) {
		return memberdao.getIDCheck(mem);
	}

	// 회원가입
	@Override
	public void getAddmem(MemBean bean) {
		
		// 공통
		MemberDTO mem = new MemberDTO( 
										bean.getUserid().trim(), 
										passwordEncoder.encode(bean.getUserpw()));
										
		System.out.println("MemberDTO: " + mem.toString());
		
		boolean b = memberdao.getAddmem(mem);
		
		// 추가
		P_MemberDTO pmem = new P_MemberDTO(
											bean.getUserid().trim(), 
											bean.getUsername().trim(),
											bean.getPostcode().trim(),
											bean.getAddress().trim(),
											bean.getDetailAddress().trim(),
											bean.getPhone().trim(),
											bean.getUseremail().trim(),
											bean.getGender().trim(),
											bean.getBirth().trim(),
											bean.getCount());
		
		// 권한
		AuthoritiesDTO amem = new AuthoritiesDTO(bean.getUserid(), bean.getAuthority());
		
		if(b) {
			memberdao.getPAddmem(pmem);
			memberdao.getAuthAddmem(amem);
		}
		
		
		
		
		
	}



	








}
