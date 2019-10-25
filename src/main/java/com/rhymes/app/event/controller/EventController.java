package com.rhymes.app.event.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.event.service.EventService;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;

@Controller
@RequestMapping(value="/event/*")
public class EventController {

	@Autowired
	private EventService eventService;

	// 이벤트 전체 리스트
	@GetMapping("/eventmain")
	public String eventmain(Model model, EventParam param) {
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		//글의 총수
		int totalRecordCount = eventService.getEventCount(param);
		List<EventDTO> eventlist = eventService.geteventlist(param); 
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("eventlist", eventlist);

		return "eventList.tiles";
	}
	
	@GetMapping("/eventdetail")
	public String eventdetail(EventDTO dto, Model model) {
		
		EventDTO event = eventService.geteventdetail(dto);
		model.addAttribute("event", event);

		return "eventdetail.tiles";
	}
	
	// 이벤트 쿠폰 insert
	@ResponseBody
	@RequestMapping(value = "/eventcoupon", method = RequestMethod.GET)
	public String eventcoupon(MemberCouponDetailDTO dto, Principal prc, Model model)throws Exception{
		System.out.println("eventcoupon controller 도착");
		dto.setUserid(prc.getName());
		
		// 이미 발급받은 쿠폰인지 확인
		boolean a = eventService.geteventduplicate(dto);
		
		String msg = "";
		
		if(a) {
			msg = "no";
		}
		else {
			eventService.eventcoupon(dto);	// 'rhy_mem_coupon_detail' insert
			msg = "ok";			
		}

		return msg;
	}
	
	// 종료된 이벤트
	@GetMapping("/eventEnd")
	public String eventEnd(Model model, EventParam param) {
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		//글의 총수
		int totalRecordCount = eventService.getEvenEndtCount(param);
		List<EventDTO> eventlist = eventService.geteventEndlist(param); 
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("eventlist", eventlist);

		return "eventListEnd.tiles";
	}
	
}