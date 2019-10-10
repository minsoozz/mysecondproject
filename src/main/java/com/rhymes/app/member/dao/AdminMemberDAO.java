package com.rhymes.app.member.dao;

import java.util.List;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.model.P_MemberDTO;

public interface AdminMemberDAO {
	
	// memlist
	public List<MemBean> getmemlist(MemberParam param);

	// list 총 수
	public int getmemCount(MemberParam param);
	
	// 수정창으로 회원정보 불러오기
	public P_MemberDTO getAdMem(String id);

	// 회원정보 수정
	public void getAdMemAf(P_MemberDTO pmem);
}
