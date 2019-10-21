package com.rhymes.app.admin.events.controller;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.PointsDTO;
import com.rhymes.app.admin.events.service.AdminPointsService;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;

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
		log.info("showMypageAdminPoints()");
		//log.info("오자마자pDto : " + pDto);
		//테이블 컬럼 문자열
		String[] cols = {"No", "ID", "내용", "적립액", "사용금액", "사용가능금액", "만료일", "쿠폰번호"};
		
		pDto.setTotalSize(adminPointsService.getTotalCountOfPoints(pDto));
		
		
		//log.info("pDto : " + pDto);
		
		model.addAttribute("cols", cols);
		model.addAttribute("pDto", pDto);
		model.addAttribute("pointsList", adminPointsService.getPointsLogByConditions(pDto));
		
		return "admin/member/mypage/points";
	}
	
	/**Ajax 통신을 통해 적립금 내용 수정
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/points/updatedetail", method = RequestMethod.POST)
	public String updatePointDetail(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		log.info("updatePointDetail()");
		log.info( jsMap.get("seq") + "" );
		log.info( jsMap.get("comment") + "" );
		log.info( jsMap.get("amount") + "" );
		log.info( jsMap.get("used_amount") + "" );
		/* 선언부 */
		PointsDTO pDto = PointsDTO.builder().seq( Integer.parseInt(jsMap.get("seq") + "") )
											.comment( jsMap.get("comment") + "" )
											.amount( Integer.parseInt(jsMap.get("amount") + "" ) )
											.used_amount( Integer.parseInt(jsMap.get("used_amount") + "") ).build();
		log.info(pDto.toString());
		
		
		/* 수행부 */
		//업데이트 완료되면 1리턴, 오류발생하면 0리턴
		int updateResult = 0;
		try {
			updateResult = adminPointsService.updatePointsDetail(pDto);
			
			switch(updateResult) {
				case 1 : return "1";
				default : return "0";
			}
			
		}catch (Exception e) {
			return "0";
		}		
	}
}
