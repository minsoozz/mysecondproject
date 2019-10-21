package com.rhymes.app.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.event.service.EventService;

@Controller
@RequestMapping(value="/event/*")
public class EventController {

	@Autowired
	private EventService eventService;
	
	@GetMapping("/eventmain")
	public String eventmain() {
		return "eventList.tiles";
	}
}
