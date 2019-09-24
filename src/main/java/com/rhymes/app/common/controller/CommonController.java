package com.rhymes.app.common.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.common.service.CommonService;
import com.rhymes.app.common.service.KakaoAPI;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;

@Controller
@RequestMapping("/welcome")
public class CommonController {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private CommonService memService;
	@Autowired
	private KakaoAPI kakao;
	
	@GetMapping("/main")
	public String welcome(Model model) {
		
		List<MemberDTO> list = sqlSession.selectList("common.getList");
		
		model.addAttribute("list", list);
		
		return "welcome";
	}
	
	

}
