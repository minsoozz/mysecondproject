package com.rhymes.app.admin.used.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.admin.used.service.AdminUsedService;
import com.rhymes.app.used.model.BlacklistDto;
import com.rhymes.app.used.model.ProductsDto;

@Controller
@RequestMapping(value = "admin/*")
public class AdminUsedController {

	@Autowired
	AdminUsedService adminUsedService;

	@GetMapping(value = "/mem_blacklist")
	public String getblacklist(Model model) {
		System.out.println("하위");

		return "admin/used/admin_used_blacklist";
	}

	@GetMapping(value = "/used/usedlist")
	public String getAdminUsedlist(Model model, ProductsDto pDto, AdminBbsParam adparam) {
		System.out.println(adparam.toString());
		List<ProductsDto> list = adminUsedService.getAdminUsedlist(pDto);
		
		int totalRecordCount = adminUsedService.getAdminBbsCount(adparam);
		System.out.println(totalRecordCount);
		model.addAttribute("list", list);

		return "admin/used/admin_used_sell_list";
	}
}
