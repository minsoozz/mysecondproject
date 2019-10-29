package com.rhymes.app.member.dao;

import java.util.List;

import com.rhymes.app.member.model.mypage.MemberProductDTO;

//@Repository
//public interface WishlistHibernateRepo extends CrudRepository {
public interface WishlistHibernateRepo {
	
	List<MemberProductDTO> findByPSeq(int p_seq);
}
