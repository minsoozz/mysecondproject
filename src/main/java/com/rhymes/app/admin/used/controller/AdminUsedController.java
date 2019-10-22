package com.rhymes.app.admin.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="admin/*")
public class AdminUsedController {
	
	@GetMapping(value="/mem_blacklist")
	public String getblacklist(Model model) {
		System.out.println("하위");
		
		return "admin/used/admin_used_blacklist";
	}
	
	@GetMapping(value="/used/usedlist")
	public String getused(Model model) {
		System.out.println("하위루");
		
		return "admin/used/admin_used_sell_list";
	}
}
