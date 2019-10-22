package com.rhymes.app.admin.event.service;

import java.util.List;

import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;

public interface AdminEventService {
	
	// 이벤트 리스트
	public List<EventDTO> getEventList(EventParam param);	

	// 리스트 count
	public int getEventCount(EventParam param);
	
	// 이벤트 글 작성
	public void geteventwrite(EventDTO dto);
}
