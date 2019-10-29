package com.rhymes.app.member.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.mypage.MemberProductDTO;

@Repository
public class WishlistHibernateRepository {

	@PersistenceContext
    EntityManager em;

	// select
    public MemberProductDTO findProduct(int seq){
          return em.find(MemberProductDTO.class, seq);
    }

}
