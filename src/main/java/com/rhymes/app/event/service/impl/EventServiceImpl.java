package com.rhymes.app.event.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.event.dao.EventDAO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.service.EventService;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	// 이벤트 리스트
	@Override
	public List<EventDTO> geteventlist() {
		return eventDAO.geteventlist();
	}
	
}
