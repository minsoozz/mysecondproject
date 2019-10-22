package com.rhymes.app.admin.event.controller;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rhymes.app.admin.event.service.AdminEventService;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/event/*")
public class AdminEventController {

	HttpSession session;

	@Autowired
	AdminEventService adminEventService;

	
	@RequestMapping(value = "/eventlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminlist(Model model, EventParam param){
		
		log.warn("eventlist controller");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<EventDTO> eventlist = adminEventService.getEventList(param);
		
		//글의 총수
		int totalRecordCount = adminEventService.getEventCount(param);
		model.addAttribute("eventlist", eventlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		// 추가
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
			
		
		return "admineventlist.tiles";
	}
	
	// 글쓰기
	@GetMapping("/write")
	public String getEventWrite(Model model) {
		// 오늘 시간을 얻어옴
		Calendar cal = Calendar.getInstance();
		int monthMax = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	//getActualMaximum:해당 달의 마지막 날짜까지 day생성
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONDAY) +1;	// 0부터 시작하기때문에 +1
		int tday = cal.get(Calendar.DATE);

		Date date = new Date();			// 현재시간
		int thour = date.getHours();
		int tminute = date.getMinutes();
		
		model.addAttribute("cal", cal);
		model.addAttribute("monthMax", monthMax);
		model.addAttribute("tyear", tyear);
		model.addAttribute("tmonth", tmonth);
		model.addAttribute("tday", tday);
		model.addAttribute("thour", thour);
		model.addAttribute("tminute", tminute);
		
		
		return"write.tiles";
	}
	
	// event 글 작성
	@RequestMapping(value = "/eventwrite", method = RequestMethod.POST)
	public String eventwrite(EventDTO dto, MultipartHttpServletRequest mulreq, HttpServletRequest req)throws Exception{
		System.out.println("1");
		// 시작시간, 종료시간 합치기
		dto.sdate(dto.getSyear(), dto.getSmonth(), dto.getSday(), dto.getShour(), dto.getSminute());
		dto.edate(dto.getEyear(), dto.getEmonth(), dto.getEday(), dto.getEhour(), dto.getEminute());
		
		List<MultipartFile> list = mulreq.getFiles("files");

		int size = list.size();
		
		Iterator<String> files = mulreq.getFileNames();
		System.out.println(files);
		MultipartFile mpf = mulreq.getFile(files.next());
		
		String path = req.getServletContext().getRealPath("/upload/event");
		System.out.println("path:" + path);
		String photo_banner = "";
		String photo_banner_sys = "";
		
		System.out.println("2");
		if(list != null && size >0) {
			for (MultipartFile mf : list) {
				String originFileName = mf.getOriginalFilename();
	            String systemFileName = System.currentTimeMillis() + originFileName;	            
   
	            photo_banner += originFileName + ",";
	            photo_banner_sys += systemFileName + ",";
	            
	            long fileSize = mf.getSize();
      
				FileOutputStream fs = new FileOutputStream(path + "/" + systemFileName);
				
				System.out.println("-------------path: "+path); // 업로드 경로
				
				fs.write(mf.getBytes());
				fs.close();
			}
		}
		dto.setPhoto_banner(photo_banner);
		dto.setPhoto_banner_sys(photo_banner_sys);
		System.out.println("dto toString: "+dto.toString());
		adminEventService.geteventwrite(dto);
		
		return "redirect:/admin/event/eventlist";
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
