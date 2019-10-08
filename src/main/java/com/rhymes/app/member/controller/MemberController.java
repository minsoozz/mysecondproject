package com.rhymes.app.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.service.MemberService;
import com.rhymes.app.member.service.impl.KakaoAPI;
import com.rhymes.app.member.util.Coolsms;
import com.rhymes.app.member.util.NaverLoginBO;
import com.rhymes.app.member.util.RhymesMailling;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Autowired
	private MemberService memService;
	@Autowired
	private KakaoAPI kakao;

	/*
	 * NaverLoginBO private NaverLoginBO naverLoginBO; private String apiResult =
	 * null;
	 * 
	 * @Autowired private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	 * this.naverLoginBO = naverLoginBO; }
	 */

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
	 * // 사업자 회원가입 창 detail
	 * 
	 * @GetMapping("/regiSellerDetail") public String regiSellerDetail() { return
	 * "rhyregiSellerDetail"; }
	 */

	// id체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getIDCheck")
	public String getIDCheck(MemberDTO mem, HttpServletRequest req) {
		System.out.println("getIDCheck mem toString: " + mem.toString());

		String userid = (String) req.getParameter("id");
		System.out.println("userid: " + userid);

		mem.setUserid(userid);

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
	public String addseller(HttpServletRequest req, SellerCRnumDTO crdto, Model model) {
		System.out.println("crdto toString: " + crdto.toString());

		req.getSession().setAttribute("crdto", crdto);

		model.addAttribute("crdto", crdto);

		return "rhyregisellerdetail";
	}

	// 사업자회원가입(사업자 추가정보)
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/addsellerdetail")
	public String addsellerdetail(HttpServletRequest req, MemberDTO mem, SellerBean sellerbean) {
//		SellerCRnumDTO crdto = (SellerCRnumDTO)req.getSession().getAttribute("crdto");	// session 잘 넘어왔는지 확인용
		// System.out.println("addsellerdetail Controller crdto: " + crdto);

		System.out.println("addsellerdetail Controller sellerbean: " + sellerbean);

		memService.getAddSeller(sellerbean, mem); // 사업자 회원가입

		return "rhyregisuc";
	}

	// 사업자 번호조회 api
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getCRCheck99999999")
	public String getCRCheckAPI(HttpServletRequest req, SellerCRnumDTO crdto) {

		int crnum1 = Integer.parseInt(req.getParameter("_c_num1"));
		int crnum2 = Integer.parseInt(req.getParameter("_c_num2"));
		int crnum3 = Integer.parseInt(req.getParameter("_c_num3"));
		BufferedReader br = null;
		String result = "";
		String msg = "";
		try {
			String urlstr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?ldong_addr_mgpl_dg_cd=41&ldong_addr_mgpl_sggu_cd=117&ldong_addr_mgpl_sggu_emd_cd=101&wkpl_nm=삼성전자&bzowr_rgst_no=124815&pageNo=10&startPage=10&numOfRows=1&pageSize=1&serviceKey=vDwpNyDDSgPT9K58OQdG1rHmcKsy7tI%2BTDCcS6vdn1lOvzUZsoAETPrlBcpCdVmIlGH51ZtyvZxjtnMl8SNbDA%3D%3D";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

			String line;
			while ((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			System.out.println("result : " + result);
		} catch (Exception e) {
			System.out.println("@@e.getMessage() : " + e.getMessage());
		}

		if (result == "<OpenAPI_ServiceResponse>" + "<cmmMsgHeader>" + "<errMsg>SERVICE ERROR</errMsg>"
				+ "<returnAuthMsg>SERVICE_ACCESS_DENIED_ERROR</returnAuthMsg>"
				+ "<returnReasonCode>20</returnReasonCode>" + "</cmmMsgHeader>" + "</OpenAPI_ServiceResponse>") {
			msg = "NO";
		}

		return result;
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

		// 사업자테이블에 있는지, 우리사이트에 등록된 사업자인지 확인
		int count = memService.getCRCYN(crdto); // 이미 등록되어있는지 확인
		System.out.println("count: " + count);

		String crname = "";
		String msg = "";

		if (count != 0) { // 라임즈에 등록되어있는 사업자번호
			msg = "1";
		} else {

			crname = memService.getCRCheck(crdto); // 사업자번호명단에 있는지 확인
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

		String e1 = (String) req.getParameter("e1");
		String e2 = (String) req.getParameter("e2");
		String userEmail = e1 + "@" + e2;
		System.out.println("userEmail: " + userEmail);

//		System.out.println("RhymesMailling.getAuthorizationCode() === " + RhymesMailling.getAuthorizationCode());

		String code = "";
		code = (String) req.getParameter("code");
		System.out.println("code: " + code);
		RhymesMailling.sendMail(RhymesMailling.getAuthorizationCode(code), userEmail);

		String msg = code;

		return msg;
	}

	// 이메일 체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getEmailCheck2")
	public String getEmailCheck2(HttpServletRequest req) {

		String useremail = (String) req.getParameter("useremail");
		System.out.println("useremail: " + useremail);

//			System.out.println("RhymesMailling.getAuthorizationCode() === " + RhymesMailling.getAuthorizationCode());

		String code = "";
		code = (String) req.getParameter("code");
		System.out.println("code: " + code);
		RhymesMailling.sendMail(RhymesMailling.getAuthorizationCode(code), useremail);

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

		set.put("to", (String) request.getParameter("to")); // 받는 사람
		set.put("from", "01092557316"); // 발신번호
		set.put("text", "비마켓 인증번호 [" + (String) request.getParameter("text") + "]"); // 문자내용
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);
		System.out.println(set.get("to"));

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {
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

	// id찾기 view이동
	@GetMapping("/getfindid")
	public String findid() {
		return "rhyfindid";
	}

	// id찾기
	@GetMapping("/getFindID")
	public String getFindID(MemBean mbean, Model model) {
		System.out.println("아이디찾기 mbean: " + mbean);

		String foundId = memService.getFindID(mbean);
		String userid = foundId; // 이메일로 아이디를 보낼 때 사용

		System.out.println("id찾기 foundId : " + foundId);

		String msg = "";
		String founduserid = "";
		if (foundId.equals("N")) { // 일치하는 아이디 없음
			msg = "N";
		} else {
			msg = foundId.substring(0, foundId.length() - 3);
			founduserid = msg + "***";
		}
		System.out.println("founduserid: " + founduserid);

		model.addAttribute("founduserid", founduserid);
		model.addAttribute("userid", userid);
		model.addAttribute("useremail", mbean.getUseremail());

		return "rhyfindAf";
	}

	// id이메일로 보내기
	@GetMapping("/getFindIDEmail")
	public String getFindIDEmail(P_MemberDTO pmem) {

		String useremail = pmem.getUseremail();
		String userid = pmem.getUserid();

		System.out.println("useremail: " + useremail);
		RhymesMailling.sendMailId(RhymesMailling.getAuthorizationid(userid), useremail);

		return "redirect:/member/login";
	}

	// 사업자 아이디 찾기
	@GetMapping("/getFindID_seller")
	public String getfindid_seller(SellerBean sbean, Model model) {

		SellerDTO sdto = memService.getfindid_seller(sbean);

		String msg = "";
		String sellerid = "";

		if (sdto.getId() == "" || sdto.getId() == null) {
			return "rhyfindid";
		} else {

			msg = sdto.getId().substring(0, sdto.getId().length() - 3);
			sellerid = msg + "***";
			System.out.println("sellerid: " + sellerid);

			model.addAttribute("foundsellerid", sellerid); // id***
			model.addAttribute("sellerid", sdto.getId()); // 사업자 아이디
			model.addAttribute("selleremail", sdto.getIc_email()); // 사업자 이메일
			return "rhyfindAf";

		}

	}

	// 사업자 id 이메일로 보내기
	@GetMapping("/getFindIDEmail_seller")
	public String getFindIDEmail_seller(SellerDTO sdto, Model model) {

		String ic_email = sdto.getIc_email();
		String id = sdto.getId();

		System.out.println("ic_email: " + ic_email);
		RhymesMailling.sendMailId(RhymesMailling.getAuthorizationid(id), ic_email);

		model.addAttribute("text", "회원님의 이메일로 id를 보냈습니다.");

		return "rhyfindsuc";
	}

	// 사업자 비밀번호 찾기
	@GetMapping("/getFindPw_seller")
	public String getFindPw_seller(SellerBean sbean, Model model) {

		boolean b = memService.getfindpw_seller(sbean);

		if (b) {
			model.addAttribute("userid", sbean.getUserid());
			return "rhypwreset";
		} else {
			return "rhyfindpw";
		}

	}

	// 비밀번호 찾기
	@GetMapping("/getfindpw")
	public String getfindpw() {
		return "rhyfindpw";
	}

	@GetMapping("/getFindPWtel")
	public String getFindPWtel(P_MemberDTO pmem, Model model) {
		System.out.println("phone: " + pmem.getPhone());
		String userid = memService.getusertel(pmem);
		System.out.println("userid: " + userid);
		System.out.println("dbuserid: " + pmem.getUserid());
		if (!userid.equals(pmem.getUserid())) {
			return "rhyfindid";
		} else {
			model.addAttribute("userid", userid);
			return "rhypwreset";
		}

	}

	// 비밀번호 수정
	@GetMapping("/userpwreset")
	public String userpwreset(MemberDTO mem, HttpServletRequest req, Model model) {

		memService.getuserpwreset(mem);
		model.addAttribute("text", "비밀번호가 성공적으로 변경되었습니다.");

		return "rhyfindsuc";

	}

	// 카카오 회원가입
	@RequestMapping(value = "/member/kakaoLogin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest req, HttpSession session,
			Model model, MemBean mbean) {

		System.out.println("kakaoLogin controller 도착");

		/*
		 * 컨트롤러에서 보낼 때(addFlashAttribute으로는 post로 보내지지않아서 주석) CsrfToken token = new
		 * HttpSessionCsrfTokenRepository().loadToken(req);
		 * 
		 * redirectAttributes.addFlashAttribute(token.getParameterName(), token);
		 * redirectAttributes.addFlashAttribute("username", mbean.getUserid());
		 * redirectAttributes.addFlashAttribute("password", mbean.getUserpw());
		 * 
		 */

		CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(req);

		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		System.out.println("kakaologin Controller : " + userInfo);

		mbean.setUserid((String) userInfo.get("email"));
		boolean b = memService.getkakaouser(mbean); /* select해서 찾은이메일이 없다면 밑에 실행 */
		req.getSession().setAttribute("userloginid", (String) userInfo.get("nickname"));
		if (b) {

			model.addAttribute("username", (String) userInfo.get("email"));
			model.addAttribute("password", (String) userInfo.get("nickname"));
			model.addAttribute("_csrf", token);
//			model.addAttribute("_csrf", CsrfToken.class.getName());
			
			return "kakaologinsuc";
		} else if (userInfo.get("email") != null) {

			String useremail = (String) userInfo.get("email");
			String username = (String) userInfo.get("nickname");
			String userpw = (String) userInfo.get("nickname"); // 비밀번호 대용

			mbean.setUseremail(useremail);
			mbean.setUsername(username);
			mbean.setUserpw(userpw);

			memService.getkakaoregi(mbean); // email, 이름, pw를 넣음, sns로그인구분

			// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//			session.setAttribute("email", userInfo.get("email"));
//			session.setAttribute("access_Token", access_Token);

//			model.addAttribute("userInfo", userInfo);

			model.addAttribute("username", (String) userInfo.get("email"));
			model.addAttribute("password", (String) userInfo.get("nickname"));
			model.addAttribute("_csrf", token);

			return "kakaologinsuc";

		} else {

			String username = (String) userInfo.get("nickname");
			String userpw = (String) userInfo.get("nickname"); // 비밀번호 대용

			mbean.setUsername(username);
			mbean.setUsername(userpw);

			model.addAttribute("username", username);
			model.addAttribute("userpw", userpw);

			return "kakaoLoginadd";
		}

	}

	// 카카오 추가정보 입력 후 로그인
	@GetMapping("/kakaoregiAf")
	public String kakaoregiAf(MemBean mbean, HttpServletRequest req, Model model) {

		memService.getkakaoregi(mbean);
//		model.addAttribute("text", "비밀번호가 성공적으로 변경되었습니다.");

		CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(req);

		model.addAttribute("username", mbean.getUseremail());
		model.addAttribute("password", mbean.getUserpw());
		model.addAttribute("_csrf", token);
		req.getSession().setAttribute("userloginid", mbean.getUserpw());
		return "kakaologinsuc";

	}

	// 로그아웃
	@GetMapping("/kakaoLogout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "main/welcome";
	}
	
	
	@GetMapping("/callback")
	public String navercallback(HttpSession session) {
		System.out.println("callback Controller 도착");
		
		
		
		return "navercallback";
	}
	
	@GetMapping("/loginPostNaver")
	public String loginPOSTNaver(Model model, HttpSession session, MemBean mbean, HttpServletRequest req) {
		System.out.println("loginPostNaver도착");
		
		System.out.println("mbean useremail: " + mbean.getUseremail());	// id에 넣을 정보
		System.out.println("mbean username: " + mbean.getUsername());	// pw에 넣을 정보

		CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(req);
		
		boolean b = memService.getNaveruser(mbean);
		req.getSession().setAttribute("userloginid", mbean.getUsername());
		if(b) {
			System.out.println("naver회원정보 있음");
			model.addAttribute("username", mbean.getUseremail());
			model.addAttribute("password", mbean.getUsername());
			model.addAttribute("_csrf", token);
			
			return "kakaologinsuc";
		}
		
		System.out.println("naver회원정보 없음");
		
		memService.getNaverRegi(mbean);
		model.addAttribute("username", mbean.getUseremail());
		model.addAttribute("password", mbean.getUsername());
		model.addAttribute("_csrf", token);
		
		return "kakaologinsuc";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	 * apiResult json 구조 {"resultcode":"00", "message":"success",
	 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
	 **/
	/*
	 * //네이버 로그인 성공시 callback호출 메소드
	 * 
	 * @RequestMapping(value = "/callback", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String callback(Model model, @RequestParam
	 * String code, @RequestParam String state, HttpSession session) throws
	 * IOException, ParseException { System.out.println("여기는 callback");
	 * OAuth2AccessToken oauthToken; oauthToken =
	 * naverLoginBO.getAccessToken(session, code, state); //1. 로그인 사용자 정보를 읽어온다.
	 * apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	 * 
	 * //2. String형식인 apiResult를 json형태로 바꿈 JSONParser parser = new JSONParser();
	 * Object obj = parser.parse(apiResult); JSONObject jsonObj = (JSONObject) obj;
	 * //3. 데이터 파싱 //Top레벨 단계 _response 파싱 JSONObject response_obj =
	 * (JSONObject)jsonObj.get("response"); //response의 nickname값 파싱 String nickname
	 * = (String)response_obj.get("nickname"); System.out.println(nickname); //4.파싱
	 * 닉네임 세션으로 저장 session.setAttribute("sessionId",nickname); //세션 생성
	 * model.addAttribute("result", apiResult); return "login"; }
	 * 
	 * //로그아웃
	 * 
	 * @RequestMapping(value = "/naverlogout", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String naverlogout(HttpSession session)throws
	 * IOException { System.out.println("여기는 logout"); session.invalidate(); return
	 * "redirect:index.jsp"; }
	 */

}
