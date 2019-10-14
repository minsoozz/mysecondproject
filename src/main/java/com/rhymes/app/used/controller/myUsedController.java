package com.rhymes.app.used.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.Service.MyUsedService;
import com.rhymes.app.used.Service.UsedService;

@RequestMapping(value = "mypage/*")
@Controller
public class myUsedController {

	@Autowired
	MyUsedService MyusedService;

	@Autowired
	UsedService usedService;

	@GetMapping(value = "/notes") // 쪽지 메인 View
	public String getNotesList(Model model, Principal prc) {
		P_MemberDTO dto = usedService.getMemberDto(prc.getName());
		System.out.println(dto.toString());
		model.addAttribute("dto", dto);

		return "notes.tiles";
	}

	@GetMapping(value = "/noteswrite") // 쪽지 보내기 팝업
	public String NotesWrite(Model model, Principal prc) {

		return "notesWrite.tiles";
	}

	@GetMapping(value = "/json") // 쪽재 보내기 자동 검색
	@ResponseBody
	public List<String> json(String value, Principal prc) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("value", value);
		map.put("id", prc.getName());
		
		List<String> member = MyusedService.getMemberid(map);

		System.out.println(member.toString());

		return member;
	}

	@GetMapping(value = "/subscribe")
	@ResponseBody
	public String subscribe(String subscribe, String id) {
		System.out.println(subscribe);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("subscribe", subscribe);
		map.put("id", id);
		
		 boolean b = MyusedService.getsubscribe(map);	// 수신 여부 확인
		 
		 System.out.println(b);
		 
		 int num;	// ajax 리턴 변수
		 if(b) {	// 회원의 좋아요 여부 확인
			 MyusedService.deletesubscribe(map);	// 수신거부 취소
			 num = 0;
		 } else {
			 MyusedService.addsubscribe(map);	// 수신거부 설정
			 num = 1;
		 }

		return num+"";
	}
}
