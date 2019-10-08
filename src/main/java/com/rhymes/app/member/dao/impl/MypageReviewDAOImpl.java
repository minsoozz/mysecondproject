package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypageReviewDAO;

@Repository
public class MypageReviewDAOImpl implements MypageReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "review.";
	
	/**매개변수로 받은 유저ID가 갖고있는 모든 주문번호를 가져옴
	 * @param userid
	 * @return
	 */
	@Override
	public List<String> getPaymentCodesByUserid(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getPaymentCodesByUserid", userid);
	}

	
}
