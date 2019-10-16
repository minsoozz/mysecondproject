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
import com.rhymes.app.used.model.NotesDto;

@RequestMapping(value = "mypage/*")
@Controller
public class myUsedController {

	@Autowired
	MyUsedService MyusedService;

	@Autowired
	UsedService usedService;

	@GetMapping(value = "/notes") // 쪽지 메인 View
	public String getNotesList(Model model, Principal prc) {
		P_MemberDTO dto = usedService.getMemberDto(prc.getName());	// 회원 정보를 얻는다
		
		System.out.println(prc.getName());
		List<NotesDto> slist = MyusedService.getsendnotes(prc.getName());	// 회원 정보로 쪽지목록을 얻는다
		List<NotesDto> rlist = MyusedService.getrecvnotes(prc.getName());	// 회원 정보로 쪽지목록을 얻는다
		System.out.println("slist" + slist.toString());
		System.out.println("rlist" + rlist.toString());
		
		model.addAttribute("slist", slist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("dto", dto);

		return "notes.tiles";
		
	}
	
	
	@GetMapping(value = "/notesdetail") // 쪽지 내용 보기
	public String notesdetail(Model model, Principal prc, String seq) {
		System.out.println(seq);
		NotesDto ndto = MyusedService.getnotesdetail(seq);
		
		model.addAttribute("dto", ndto);
		
		return "notesdetail.tiles";
	}
	
	@GetMapping(value = "/noteswrite") // 쪽지 보내기 팝업띄우기
	public String NotesWrite(Model model, Principal prc) {

		return "notesWrite.tiles";
	}
	
	@GetMapping(value = "/noteswriteAf") // 쪽지가 DB에 저장되는 부분
	public String NotesWriteAf(Model model, Principal prc,NotesDto ndto, boolean save) {

		if(save) {
			ndto.setSend_del("N");
		} else {
			ndto.setSend_del("Y");
			
		}
		
		System.out.println(ndto.toString());
		
		boolean b = MyusedService.sendnotes(ndto);
		
		if(b) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		return "";
	}

	@GetMapping(value = "/json") // 쪽지 보내기 자동 검색
	@ResponseBody
	public List<String> json(String value, Principal prc) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("value", value);
		map.put("id", prc.getName());
		
		List<String> member = MyusedService.getMemberid(map);

		System.out.println(member.toString());

		return member;
	}
	
	@GetMapping(value = "/idcheck") // 쪽재 보내기 자동 검색
	@ResponseBody
	public String idcheck(String id) {
	
		int n = MyusedService.idcheck(id);

		return n+"";
	}
	
	
	@GetMapping(value="/notesdelete")	// 쪽지 삭제
	public String notesdelete(NotesDto ndto) {
		System.out.println(ndto.toString());
		
		boolean b = MyusedService.notesdelete(ndto);
		
		if(b) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("실패");
		}
		return "redirect:/notes";
	}
	
	@GetMapping(value="/notesdelete2")	// 쪽지 삭제2
	public String notesdelete2(NotesDto ndto) {
		System.out.println(ndto.toString());
		
		boolean b = MyusedService.notesdelete2(ndto);
		
		if(b) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("실패");
		}
		return "redirect:/notes";
	}
	
	
	@GetMapping(value="/notesanswer")
	public String notesanswer(NotesDto ndto,Model model) {
		
		model.addAttribute("dto", ndto);
		
		return "notesanswer.tiles";
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
