package com.rhymes.app.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.common.service.KakaoAPI;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.service.MemberService;
import com.rhymes.app.member.util.Coolsms;
import com.rhymes.app.member.util.RhymesMailling;


@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Autowired
	private MemberService memService;
	@Autowired
	private KakaoAPI kakao;

	HttpSession session;

	// 회원가입 선택 창
	@GetMapping("/regiMain")
	public String regimain() {
		return "rhyregimain";
	}

	// 일반회원 회원가입 창
	@GetMapping("/regimember")
	public String regimember() {
		return "rhyregimember";
	}
	// 사업자 회원가입 창
	@GetMapping("/regiseller")
	public String regiseller() {
		return "rhyregiseller";
	}
	/*
	// 사업자 회원가입 창 detail
	@GetMapping("/regiSellerDetail")
	public String regiSellerDetail() {
		return "rhyregiSellerDetail";
	}
	*/

	// id체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getIDCheck")
	public String getIDCheck(MemberDTO mem) {
		System.out.println("getIDCheck mem toString: " + mem.toString());

		int count = memService.getIDCheck(mem);
		System.out.println("count: " + count);

		String msg = "";
		if (count > 0) {
			msg = "YES";
		} else {
			msg = "NO";
		}

		return msg;
	}

	// 일반회원가입
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/addmem")
	public String addmem(MemBean bean) {
		System.out.println("addmem mem: " + bean.toString());
		
		memService.getAddmem(bean);

		return "rhyregisuc";
	}
	
	// 사업자회원가입(공통)
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/addseller")
	public String addseller(HttpServletRequest req, MemberDTO mem, Model model) {
		System.out.println("mem toString: "+ mem.toString());
		
		req.getSession().setAttribute("mem", mem);
		
		model.addAttribute("userid", mem.getUserid());
		
		return "rhyregisellerdetail";
	}
	
	// 사업자회원가입(사업자 추가정보)
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/addsellerdetail")
	public String addsellerdetail(HttpServletRequest req, SellerBean sellerbean) {
		MemberDTO mem = (MemberDTO)req.getSession().getAttribute("mem");
		System.out.println("mem: " + mem);
		
		memService.getAddSeller(sellerbean);			// 사업자 회원가입
		
		
		return "rhyregisuc";
	}

	
	// 사업자번호 체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getCRCheck")
	public String getCRCheck(HttpServletRequest req, SellerCRnumDTO crdto) {
		
		int crnum1 = Integer.parseInt(req.getParameter("_c_num1"));
		int crnum2 = Integer.parseInt(req.getParameter("_c_num2"));
		int crnum3 = Integer.parseInt(req.getParameter("_c_num3"));
		
		crdto.setCrnum1(crnum1);
		crdto.setCrnum2(crnum2);
		crdto.setCrnum3(crnum3);
		
		String crname = memService.getCRCheck(crdto);
		System.out.println("crname: " + crname);

		String msg = "";
		if (crname == "" || crname == null) {
			msg = "NO";
		} else {
			msg = crname;
		}

		return msg;
	}
	
	// 이메일 체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getEmailCheck")
	public String getEmailCheck(HttpServletRequest req) {
		
		String e1 = (String)req.getParameter("e1");
		String e2 = (String)req.getParameter("e2");
		String userEmail = e1+"@"+e2;
		System.out.println("userEmail: " + userEmail);
		
//		System.out.println("RhymesMailling.getAuthorizationCode() === " + RhymesMailling.getAuthorizationCode());
		
		String code = "";
		code = (String)req.getParameter("code");
		System.out.println("code: " + code);
		RhymesMailling.sendMail(RhymesMailling.getAuthorizationCode(code), userEmail);
		
		String msg = code;
		
		return msg;
	}

	// 전화번호 인증
	@ResponseBody
	@RequestMapping(value = "/sendSms.do", method = RequestMethod.GET)
     public String sendSms(HttpServletRequest request) throws Exception {

       String api_key = "NCSIOIHJHNMGEUH7";
       String api_secret = "5DYGAAUIVWUIWA4RNHYIKIUQRF1MBM10";
     
       
       Coolsms coolsms = new Coolsms(api_key, api_secret);
       
       HashMap<String, String> set = new HashMap<String, String>();

       set.put("to", (String)request.getParameter("to")); // 받는 사람
       set.put("from", "01092557316"); // 발신번호
       set.put("text", "비마켓 인증번호 ["+(String)request.getParameter("text")+"]"); // 문자내용
       set.put("type", "sms"); // 문자 타입

       System.out.println(set);
       
       
       
       JSONObject result = coolsms.send(set); // 보내기&전송결과받기
       

       if ((boolean)result.get("status") == true) {
         // 메시지 보내기 성공 및 전송결과 출력
         System.out.println("성공");
         System.out.println(result.get("group_id")); // 그룹아이디
         System.out.println(result.get("result_code")); // 결과코드
         System.out.println(result.get("result_message")); // 결과 메시지
         System.out.println(result.get("success_count")); // 메시지아이디
         System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
       } else {
         // 메시지 보내기 실패
         System.out.println("실패");
         System.out.println(result.get("code")); // REST API 에러코드
         System.out.println(result.get("message")); // 에러메시지
       }
      
       return "suc";
     }
	
	   
	   
	// 카카오 로그인
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("kakaologin Controller : " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}
		model.addAttribute("userId", userInfo);

		return "kakologin";
	}

	// 로그아웃
	@GetMapping("/Klogout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "main/welcome";
	}
}
