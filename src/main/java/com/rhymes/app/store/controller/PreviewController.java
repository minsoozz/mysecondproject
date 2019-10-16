package com.rhymes.app.Store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rhymes.app.Store.model.DetailParam;
import com.rhymes.app.Store.model.PreviewDto;
import com.rhymes.app.Store.service.PreviewService;
import com.rhymes.app.customer.model.CustomerParam;

@Controller
@RequestMapping("/productreview")
public class PreviewController {

	@Autowired PreviewService PreviewService;
	
	//리스트가져오기
	@RequestMapping(value = "/previewlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqlist(Model model, DetailParam param){
	
		///////////////////상품후기부분////////////////
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<PreviewDto> previewlist = PreviewService.getPreviewList(param);
		
		//글의 총수
		int totalRecordCount = PreviewService.getPreviewCount(param);	
		model.addAttribute("previewlist", previewlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		return "previewlist.tiles";
	}
	
	
	
	
	
}
