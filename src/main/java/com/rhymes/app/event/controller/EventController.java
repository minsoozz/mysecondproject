package com.rhymes.app.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.service.EventService;

@Controller
@RequestMapping(value="/event/*")
public class EventController {

	@Autowired
	private EventService eventService;
	
	@GetMapping("/eventmain")
	public String eventmain(Model model) {
		
		List<EventDTO> eventlist = eventService.geteventlist(); 
		
		model.addAttribute("eventlist", eventlist);
		
		return "eventList.tiles";
	}
}
