package com.rhymes.app.event.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.common.util.MypageUtils;
import com.rhymes.app.event.dao.EventDAO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.event.service.EventService;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	// 이벤트 리스트
	@Override
	public List<EventDTO> geteventlist(EventParam param) {
		return eventDAO.geteventlist(param);
	}
	
	// 글의 총 수
	@Override
	public int getEventCount(EventParam param) {
		return eventDAO.getEventCount(param);
	}

	// 디테일
	@Override
	public EventDTO geteventdetail(EventDTO dto) {
		return eventDAO.geteventdetail(dto);
	}
	
	// 이미 발급받은 쿠폰인지 확인
	@Override
	public boolean geteventduplicate(MemberCouponDetailDTO dto) {
		return eventDAO.geteventduplicate(dto);
	}

	// 쿠폰 insert
	@Override
	public boolean eventcoupon(MemberCouponDetailDTO dto) {
		
		List<String> coupon = MypageUtils.getRandCoupsTimestampList(1);
		
		for (String cou : coupon) {
			dto.setCoup_code(cou);
		}
		
		return eventDAO.eventcoupon(dto);
	}

	// 종료된 이벤트
	@Override
	public List<EventDTO> geteventEndlist(EventParam param) {
		return eventDAO.geteventEndlist(param);
	}

	@Override
	public int getEvenEndtCount(EventParam param) {
		return eventDAO.getEvenEndtCount(param);
	}




	
}
