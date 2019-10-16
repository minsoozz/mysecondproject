package com.rhymes.app.common.service;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;

public interface CommonService {
	
	// 회원 전체 count
	public int getAllMemberList();
	
	// 오늘 가입한 회원 count
	public int getNewMemCount(String mTime);

}
