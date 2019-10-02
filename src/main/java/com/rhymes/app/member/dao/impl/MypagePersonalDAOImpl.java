package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypagePersonalDAO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;

@Repository
public class MypagePersonalDAOImpl implements MypagePersonalDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "personal.";
	
	/**매개변수로 받은 ID의 암호화된 비밀번호를 리턴
	 * @param id
	 * @return
	 */
	@Override
	public String getOnePwById(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getOnePwById", id);
	}

	/**매개변수로 받은 ID가 갖는 권한 리턴
	 * @param id
	 * @return
	 */
	@Override
	public List<String> getAuthorities(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getAuthorities", id);
	}

	/**개인회원 상세 정보 리턴(RHY_MEM_P)
	 * @param id
	 * @return
	 */
	@Override
	public P_MemberDTO getOnePersonalMemberById(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getOnePersonalMemberById", id);
	}

	/**기업회원 상세 정보 리턴(RHY_MEM_C)
	 * @param id
	 * @return
	 */
	@Override
	public SellerDTO getOneSellerMemberById(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getOneSellerMemberById", id);
	}
	
}
