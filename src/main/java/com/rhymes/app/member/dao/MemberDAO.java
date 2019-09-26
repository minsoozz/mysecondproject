package com.rhymes.app.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.rhymes.app.member.model.AuthoritiesDTO;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;

public interface MemberDAO {
	
	public MemberDTO getOneMemberByMemberId(String id);
	
	// 아이디 체크
	public int getIDCheck(MemberDTO mem);
	
	// 회원가입 insert
	public boolean getAddmem(MemberDTO mem);		// 공통
	public void getPAddmem(P_MemberDTO pmem);		// 추가
	public void getAuthAddmem(AuthoritiesDTO amem);	// 권한
	
	
}
