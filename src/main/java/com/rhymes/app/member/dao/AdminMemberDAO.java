package com.rhymes.app.member.dao;

import java.util.List;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberParam;

public interface AdminMemberDAO {
	
	// memlist
	public List<MemBean> getmemlist(MemberParam param);

	// list 총 수
	public int getmemCount(MemberParam param);
}
