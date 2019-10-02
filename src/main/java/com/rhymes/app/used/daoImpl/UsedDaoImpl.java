package com.rhymes.app.used.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.CommentsDto;
import com.rhymes.app.used.model.ProductsDto;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	SqlSession sqlSession;

	String ns = "Used.";

	@Override
	public boolean UsedWrite(ProductsDto dto) {
		// TODO Auto-generated method stub

		int n = sqlSession.insert(ns + "write", dto);

		return n > 0 ? true : false;
	}

	@Override
	public List<ProductsDto> getUsedList() {
		// TODO Auto-generated method stub

		List<ProductsDto> list = sqlSession.selectList(ns + "getUsedList");

		return list;
	}

	@Override
	public ProductsDto getUsedDetail(int seq) {
		// TODO Auto-generated method stub

		ProductsDto dto = sqlSession.selectOne(ns + "getUsedDetail", seq);

		return dto;
	}

	@Override
	public int getSellerCount(String parameter) {

		sqlSession.update(ns + "updateSellerCount", parameter);

		int count = sqlSession.selectOne(ns + "getSellerCount", parameter);

		return count;
	}

	@Override
	public P_MemberDTO getMemberDto(String userid) {

		P_MemberDTO dto = sqlSession.selectOne(ns + "getMember", userid);

		return dto;
	}

	@Override
	public boolean setSellerMember(String s_id) {

		int n = sqlSession.insert(ns + "setSellerMember", s_id);

		return n > 0 ? true : false;
	}

	@Override
	public boolean setSellerMember(P_MemberDTO p_MemberDTO) {

		sqlSession.update(ns + "setSelleraddress", p_MemberDTO);

		int n = sqlSession.insert(ns + "setSellerMember2", p_MemberDTO);

		return n > 0 ? true : false;
	}

	@Override
	public boolean addlikes(Map<String, Object> map) {
		int count = sqlSession.delete(ns + "addlikes", map);
		return count > 0 ? true : false;

	}

	@Override
	public boolean getlikes(Map<String, Object> map) {
		int count = sqlSession.selectOne(ns + "getlikes", map);
		return count > 0 ? true : false;
	}

	@Override
	public int getboardlikes(int seq) {
		int count = sqlSession.selectOne(ns + "getboardlikes", seq);
		return count;
	}

	@Override
	public boolean deletelikes(Map<String, Object> map) {
		int count = sqlSession.delete(ns + "deletelikes", map);

		return count > 0 ? true : false;
	}

	@Override
	public List<CommentsDto> getComments(int seq) {
		List<CommentsDto> list = sqlSession.selectList(ns + "getComments", seq);
		
		return list;
	}
	
	

}
