package com.rhymes.app.payment.daoImpl;

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
		 
		
		System.out.println("PaymentDAOIMPL point : " + point);
		
		return point;
	}
	
	// 결제페이지에서 사용자의 유효 쿠폰 개수 가져오기
	@Override
	public int getCountCoupon(String userid) {

		System.out.println("PaymentDAOIMPL userid : " + userid);
		
		int countCoupon = 0;
		try {
			countCoupon = SqlSession.selectOne(p + "getCountCoupon", userid);
		}catch(Exception e) {}
		
		System.out.println("PaymentDAOIMPL countCoupon : " + countCoupon);

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
		
		int countCoupon = SqlSession.selectOne(p + "getCountCoupon", userid);
		
		System.out.println("PaymentDAOIMPL 쿠폰 개수 : " + countCoupon);

		for (MemberCouponDTO _dto : coupon) {
			System.out.println("PaymentDAOIMPL 쿠폰 정보 : " + _dto.toString());
		}
		
		return coupon;
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

	// 결제시 사용한 쿠폰 삭제
	@Override
	public boolean delete_coupon_code(PaymentDTO dto) {
		
		int count = SqlSession.delete(p + "delete_coupon_code", dto);
		
		return count>0?true:false;
	}

	// 결제 후 배송 내역 저장
	@Override
	public boolean delivery_save(PaymentDTO dto) {
		
		int count = SqlSession.insert(p + "delivery_save", dto);

		return count>0?true:false;
	}

}
