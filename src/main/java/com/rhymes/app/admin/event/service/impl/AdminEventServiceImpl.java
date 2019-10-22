package com.rhymes.app.admin.event.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.event.dao.AdminEventDAO;
import com.rhymes.app.admin.event.service.AdminEventService;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminEventDAO adminEventDAO;

	// 이벤트 리스트
	@Override
	public List<EventDTO> getEventList(EventParam param) {
		return adminEventDAO.getEventList(param);
	}

	// 이벤트 count
	@Override
	public int getEventCount(EventParam param) {
		return adminEventDAO.getEventCount(param);
	}

	@Override
	public void geteventwrite(EventDTO dto) {
		adminEventDAO.geteventwrite(dto);
	}
	
}
