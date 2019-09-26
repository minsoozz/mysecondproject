package com.rhymes.app.member.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
		MemberDTO mem = (MemberDTO)req.getSession().getAttribute("mem");	// session 잘 넘어왔는지 확인용
		System.out.println("addsellerdetail Controller mem: " + mem);
		
		
		
		System.out.println("addsellerdetail Controller sellerbean: " + sellerbean);
		
		memService.getAddSeller(sellerbean, mem);			// 사업자 회원가입
		
		return "rhyregisuc";
	}
	
	// 사업자 번호조회 api
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getCRCheck")
	public String getCRCheckAPI(HttpServletRequest req, SellerCRnumDTO crdto) {
		
		int crnum1 = Integer.parseInt(req.getParameter("_c_num1"));
		int crnum2 = Integer.parseInt(req.getParameter("_c_num2"));
		int crnum3 = Integer.parseInt(req.getParameter("_c_num3"));
		 BufferedReader br = null;
		 String result = "";
		 String msg = "";
	        try{
	            String urlstr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?ldong_addr_mgpl_dg_cd=41&ldong_addr_mgpl_sggu_cd=117&ldong_addr_mgpl_sggu_emd_cd=101&wkpl_nm=삼성전자&bzowr_rgst_no=124815&pageNo=10&startPage=10&numOfRows=1&pageSize=1&serviceKey=vDwpNyDDSgPT9K58OQdG1rHmcKsy7tI%2BTDCcS6vdn1lOvzUZsoAETPrlBcpCdVmIlGH51ZtyvZxjtnMl8SNbDA%3D%3D";
	            URL url = new URL(urlstr);
	            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	            urlconnection.setRequestMethod("GET");
	            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	            
	            String line;
	            while((line = br.readLine()) != null) {
	                result = result + line + "\n";
	            }
	            System.out.println("result : " + result);
	        }catch(Exception e){
	            System.out.println("@@e.getMessage() : " + e.getMessage());
	        }
	        
	    if(result=="<OpenAPI_ServiceResponse>" + 
	    		"<cmmMsgHeader>" + 
	    		"<errMsg>SERVICE ERROR</errMsg>" + 
	    		"<returnAuthMsg>SERVICE_ACCESS_DENIED_ERROR</returnAuthMsg>" + 
	    		"<returnReasonCode>20</returnReasonCode>" + 
	    		"</cmmMsgHeader>" + 
	    		"</OpenAPI_ServiceResponse>") {
	    	msg = "NO";
	    }

		return result;
	}

	
	// 사업자번호 체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getCRCheck9999999999")
	public String getCRCheck(HttpServletRequest req, SellerCRnumDTO crdto) {
		
		int crnum1 = Integer.parseInt(req.getParameter("_c_num1"));
		int crnum2 = Integer.parseInt(req.getParameter("_c_num2"));
		int crnum3 = Integer.parseInt(req.getParameter("_c_num3"));
		
		crdto.setCrnum1(crnum1);
		crdto.setCrnum2(crnum2);
		crdto.setCrnum3(crnum3);
		
		// 사업자테이블에 있는지, 우리사이트에 등록된 사업자인지 확인
		int count = memService.getCRCYN(crdto);	// 이미 등록되어있는지 확인
		System.out.println("count: " + count);

		
		String crname = "";
		String msg = "";

		if(count!=0) {	// 라임즈에 등록되어있는 사업자번호
			msg = "1";
		}else {
			
			crname = memService.getCRCheck(crdto);	// 사업자번호명단에 있는지 확인
			System.out.println("crname: " + crname);
			
			if (crname == "" || crname == null) {
				msg = "NO";
			} else {
				msg = crname;
			}
			
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
	
	
	// 사업자회원가입(사업자 추가정보)
	@GetMapping("/findid")
	public String findid() {
		return "rhyfindid";
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
