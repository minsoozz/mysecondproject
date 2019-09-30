package com.rhymes.app.exceldown.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.rhymes.app.exceldown.model.DtestDTO;
import com.rhymes.app.exceldown.service.ExcelService;
import com.rhymes.app.exceldown.util.listExcelDownload;

@Controller
@RequestMapping("/exceldownload")
public class ExcelController {
	
	@Autowired
	ExcelService excelService;
	
	// 엑셀 다운로드 페이지로 이동
	@GetMapping("/exceldownload")
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


