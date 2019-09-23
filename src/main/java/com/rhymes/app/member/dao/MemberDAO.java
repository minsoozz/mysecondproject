package com.rhymes.app.member.dao;

import com.rhymes.app.member.model.MemberDTO;

public interface MemberDAO {
	
	public MemberDTO getOneMemberByMemberId(String id);
}
