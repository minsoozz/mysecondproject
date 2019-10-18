package com.rhymes.app.payment.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentAfDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSession SqlSession;
	private String p = "payment.";

	// 결제페이지에서 상품정보 가져오기
	@Override
	public OrderDTO getOrder(OrderDTO dto) {
		
		OrderDTO order = SqlSession.selectOne(p + "getOrder", dto);
		
		return order;
	}

	// 결제페이지에서 적립금 가져오기
	@Override
	public int getPoint(String userid) {

		int point = 0;
		try {
			point = SqlSession.selectOne(p + "getPoint", userid);
		}catch (Exception e) {	}
		
		return point;
	}
	
	// 결제페이지에서 사용자의 유효 쿠폰 개수 가져오기
	@Override
	public int getCountCoupon(String userid) {
		
		int countCoupon = 0;
		try {
			countCoupon = SqlSession.selectOne(p + "getCountCoupon", userid);
		}catch(Exception e) {}

		return countCoupon;
	}
	

	// 결제페이지에서 쿠폰세부정보 가져오기
	@Override
	public List<MemberCouponDTO> getAllCoupon(String userid) {
		
		List<MemberCouponDTO> coupon = new ArrayList<MemberCouponDTO>();
		MemberCouponDTO dto = new MemberCouponDTO();
		dto.setTitle("쿠폰없음");
		coupon.add(dto);
		
		try {
			coupon = SqlSession.selectList(p + "getAllCoupon", userid);
		}catch(Exception e) {}
		
		return coupon;
	}

	// 결제한 후 결제 디테일에 넣기위한 상품 개당 가격 가져오기
	@Override
	public int getPrice(int stock_seq) {

		int price = SqlSession.selectOne(p + "getPrice", stock_seq);
		
		return price;
	}

	// 결제한 후 결제 디테일 저장(후기여부는 false)
	@Override
	public boolean payment_detail_save(PaymentDetailsDTO dto) {

		int count = SqlSession.insert(p + "payment_detail_save", dto);

		return count>0?true:false;
	}

	// 결제한 후 상품 수량 차감
	@Override
	public boolean disc_stock_quantity(String stock_seq, String quantity) {
		
		PaymentAfDTO dto = new PaymentAfDTO(stock_seq, quantity);
		
		int count = SqlSession.update(p + "disc_stock_quantity", dto);
		
		return count>0?true:false;
	}

	// 결제한 후 사용 포인트 차감
	@Override
	public boolean disc_point(PaymentDTO dto) {
		
		int count = SqlSession.update(p + "disc_point", dto);
		
		return count>0?true:false;
	}

	// 결제 내역 저장
	@Override
	public boolean payment_save(PaymentDTO dto) {

		int count = SqlSession.insert(p + "payment_save", dto);

		return count>0?true:false;
	}

	// 결제 애프터 내역 저장
	@Override
	public boolean payment_after(PaymentAfDTO dto) {

		int count = SqlSession.insert(p + "payment_after", dto);

		return count>0?true:false;
	}

	// 결제시 사용한 쿠폰을 사용으로 변환
	@Override
	public boolean update_isused_coupon(PaymentDTO dto) {
		
		int count = SqlSession.delete(p + "update_isused_coupon", dto);
		
		return count>0?true:false;
	}

	// 결제 후 배송 내역 저장
	@Override
	public boolean delivery_save(PaymentDTO dto) {
		
		int count = SqlSession.insert(p + "delivery_save", dto);

		return count>0?true:false;
	}

	// 결제 후 장바구니 내역 삭제
	@Override
	public boolean delete_basket(String id) {

		int count = SqlSession.delete(p + "delete_basket", id);

		return count>0?true:false;
	}

}
