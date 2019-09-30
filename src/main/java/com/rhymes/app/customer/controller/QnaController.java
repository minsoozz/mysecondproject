package com.rhymes.app.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.service.QnaService;

@Controller
@RequestMapping("/Rhymes")
public class QnaController {

	@Autowired
	private QnaService QnaService;
	
	@RequestMapping(value = "/qnalist", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnalist(Model model, CustomerParam param) {
		
		model.addAttribute("doc_title", "1:1 문의");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<QnaDto> qnalist = QnaService.getQnaList(param);
		
		//글의 총수
		int totalRecordCount = QnaService.getQnaCount(param);
		model.addAttribute("qnalist", qnalist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		return "qnalist.tiles";
	}
}
