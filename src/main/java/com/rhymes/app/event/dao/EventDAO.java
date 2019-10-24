package com.rhymes.app.event.dao;

import java.util.List;

import com.rhymes.app.event.model.EventDTO;

public interface EventDAO {
	
	// 이벤트 리스트
	public List<EventDTO> geteventlist();
	
	// detail
	public EventDTO geteventdetail(EventDTO dto);

}
