package com.rhymes.app.used.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.BbsParam;
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
	public List<ProductsDto> getUsedList(BbsParam param) {
		// TODO Auto-generated method stub

		List<ProductsDto> list = sqlSession.selectList(ns + "getUsedList",param);

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
	public P_MemberDTO getMemberDto(String id) {
		P_MemberDTO dto = sqlSession.selectOne(ns + "getMember", id);
				
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

	@Override
	public boolean addComments(Map<String, Object> map) {
		int n = sqlSession.insert(ns + "addComments", map);
		return n > 0 ? true : false;
	}

	@Override
	public boolean updateComment(Map<String,Object> map) {
		int n = sqlSession.update(ns + "updateComment", map);
		return n > 0 ? true : false;
	}

	@Override
	public boolean updateReadCount(int seq) {
		int n = sqlSession.update(ns + "updateReadCount", seq);
		return n > 0 ? true : false;
	}

	@Override
	public boolean deleteComment(Map<String, Object> map) {
		int n = sqlSession.delete(ns + "deleteComment", map);
		
		return n > 0 ? true : false;
	}

	@Override
	public boolean insertanswer(Map<String, Object> map) {
				sqlSession.update(ns + "updateanswer", map);
		
		int n = sqlSession.insert(ns + "insertanswer", map);
		
		return n > 0 ? true : false;
	}

	@Override
	public boolean usedUpdate(ProductsDto dto) {
		
		int n = sqlSession.update(ns + "usedupdate", dto);
		return n > 0 ? true : false;
	}

	// 페이징을 위한 게시글 총 개수 구하기
	@Override	
	public int getBbsCount(BbsParam param) {
		int n = sqlSession.selectOne(ns + "getBbsCount", param);
		return n;
	}

	@Override
	public int getSellerid(String s_id) {
		int n = sqlSession.selectOne(ns + "getSellerid", s_id);
		
		return n;
	}

	@Override
	public boolean deleteProduct(int seq) {
		int n = sqlSession.delete(ns + "deleteProduct", seq);
		
		return n > 0 ? true :false;
	}

	@Override
	public boolean setblackList(Map<String, Object> map) {
		int n = sqlSession.insert(ns + "setblackList", map);
		
		return n > 0 ? true :false;
	}
	
	

}
