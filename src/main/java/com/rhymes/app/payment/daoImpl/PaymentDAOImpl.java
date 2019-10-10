package com.rhymes.app.payment.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSession SqlSession;
	private String p = "payment.";

	// 주문페이지에서 상품정보 가져오기
	@Override
	public OrderDTO getOrder(OrderDTO dto) {
		
		OrderDTO order = SqlSession.selectOne(p + "getOrder", dto);
		
		return order;
	}

	// 주문페이지에서 적립금 가져오기
	@Override
	public int getPoint(String id) {
		
		int point = SqlSession.selectOne(p + "getPoint", id);
		
		return point;
	}

	// 주문페이지에서 쿠폰 가져오기
	@Override
	public String getCoupon(String id) {
		
		String coupon = SqlSession.selectOne(p + "getCoupon", id);
		
		return coupon;
	}

}
