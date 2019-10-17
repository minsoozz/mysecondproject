package com.rhymes.app.admin.exceldown.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.View;

import com.rhymes.app.admin.exceldown.model.DtestDTO;
import com.rhymes.app.admin.exceldown.service.AdminExcelService;
import com.rhymes.app.admin.exceldown.util.listExcelDownload;

@Controller
public class AdminExcelController {
	
	@Autowired
	AdminExcelService excelService;
	
	// 엑셀 다운로드 페이지로 이동
	@GetMapping("/excel")
	public String exceldownload() throws Exception {
		return "exceldownload";
	}

	// 엑셀 다운로드
	@GetMapping("/exceldownloadDown")
	public View exceldownload(Model model) throws Exception {
		
	    List<DtestDTO> list = excelService.listExcelDownload();
	    model.addAttribute("list", list);
	    
	    return new listExcelDownload();
	}
	
}


