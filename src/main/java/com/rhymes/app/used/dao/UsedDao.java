package com.rhymes.app.used.dao;

import java.util.List;
import java.util.Map;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.model.ProductsDto;

public interface UsedDao {

	boolean UsedWrite(ProductsDto dto);

	List<ProductsDto> getUsedList();

	ProductsDto getUsedDetail(int seq);

	int getSellerCount(String parameter);

	P_MemberDTO getMemberDto(String userid);

	boolean setSellerMember(String s_id);
	
	boolean setSellerMember(P_MemberDTO p_MemberDTO);
	
}
