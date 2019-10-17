package com.rhymes.app.admin.events.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.service.AdminPointsService;

import lombok.extern.slf4j.Slf4j;


/**관리자페이지에서 적립금 관련 컨트롤러
 * @author minhj
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/mypage/*")
public class AdminPointsController {

	@Autowired
	private AdminPointsService adminPointsService;
	
	/**관리자-이벤트-적립금관리 뷰
	 * 페이징, 검색
	 * @return
	 */
	@RequestMapping(value = "/points", method = {RequestMethod.POST, RequestMethod.GET})
	public String showMypageAdminPoints(Model model, AdminPointsPagingDTO pDto) {
		log.info("오자마자pDto : " + pDto);
		
		pDto.setTotalSize(adminPointsService.getTotalCountOfPoints(pDto));
		
		
		log.info("pDto : " + pDto);
		
		model.addAttribute("pDto", pDto);
		model.addAttribute("pointsList", adminPointsService.getPointsLogByConditions(pDto));
		
		return "admin/member/mypage/points";
	}
}
