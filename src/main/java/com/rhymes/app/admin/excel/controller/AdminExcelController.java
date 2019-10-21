package com.rhymes.app.admin.excel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.rhymes.app.admin.excel.model.DtestDTO;
import com.rhymes.app.admin.excel.service.AdminExcelService;
import com.rhymes.app.admin.excel.util.listExcelDownload;
import com.rhymes.app.payment.model.PaymentDTO;


@Controller
public class AdminExcelController {
	
	@Autowired
	AdminExcelService excelService;
	
	// 엑셀 다운로드 페이지로 이동
	@RequestMapping("/admin/excel")
	public String excel() throws Exception {
		return "excel";
	}

	// 엑셀 다운로드
	@RequestMapping("/admin/exceldownload")
	public View exceldownload(Model model) throws Exception {
		
	    List<DtestDTO> list = excelService.listExcelDownload();
	    model.addAttribute("list", list);
	    
	    return new listExcelDownload();
	}
	
	// 데이터 전체 다운로드
	@RequestMapping("/admin/excel/all")
	public View all(Model model) throws Exception {
		
	    List<PaymentDTO> payment_list = excelService.getPaymentExcelDown();
	    model.addAttribute("payment_list", payment_list);
	    
		return new listExcelDownload();
	}
	
}


