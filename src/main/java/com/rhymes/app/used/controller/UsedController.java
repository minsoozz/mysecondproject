package com.rhymes.app.used.controller;


import java.io.FileOutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.used.Service.UsedService;
import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.ProductsDto;
import com.rhymes.app.used.util.Coolsms;


@RequestMapping("/used/*")
@Controller
public class UsedController {

	@Autowired UsedService usedService;
	
	
	@GetMapping("/hello") 
	public String test(HttpServletRequest req) {
		
		MemberDTO Mdto = new MemberDTO("mhj", "mhj");
		
		req.getSession().setAttribute("login", Mdto);
		
		return "used/test";
	}
	
	@GetMapping("usedlist")
	public String usedlist(Model model) {
		
		List<ProductsDto> list = usedService.getUsedList();
		
		model.addAttribute("list", list);
		
		return "usedlist.tiles";
	}
	
	@GetMapping("useddetail")
	public String useddetail(Model model,int seq) {
		
		ProductsDto dto = usedService.getUsedDetail(seq);
		
		String str = dto.getPhoto_sys();
		
		System.out.println(str);
		
		String arr[] = str.split(",");
		
		dto.setPhoto_list(arr);

		System.out.println(dto.toString());
		
		model.addAttribute("dto", dto);
		
		return "useddetail.tiles";
	}
	
	@GetMapping("popup")
	public String popup(Principal prc) {
		
//		String name = prc.getName();
//		System.out.println(name);
		
		return "popup";
	}
	
	@GetMapping("usedwrite")
	public String usedwrite(HttpServletRequest req, Model model) {
		
		return "usedwrite.tiles";
	}
	
	@RequestMapping(value="usedwriteAf", method = RequestMethod.POST)
	public String usedwriteAf(ProductsDto Pdto, MultipartHttpServletRequest mfreq,
			HttpServletRequest req) throws Exception {
		
		ProductsDto dto = new ProductsDto(0,
				Pdto.getS_id(),
				Pdto.getCategory(),
				Pdto.getTitle(),
				Pdto.getContent(),
				Pdto.getPrice(),
				Pdto.getQuantity(),
				Pdto.getPlace(),
				Pdto.getPhoto(),
				Pdto.getPhoto_sys(),
				Pdto.getDivision(),
				Pdto.getLikes());

		List<MultipartFile> list = mfreq.getFiles("files");

		int size = list.size();
		
		Iterator<String> files = mfreq.getFileNames();
		
		MultipartFile mpf = mfreq.getFile(files.next());
		
		String path = req.getServletContext().getRealPath("/upload");
		
		
		String photo = "";
		String photo_sys = "";
         
		if(list != null && size > 0) {
			for(MultipartFile mf : list) {
				String originFileName = mf.getOriginalFilename();
	            String systemFileName = System.currentTimeMillis() + originFileName;	            
   
	            photo += originFileName + ",";
	            photo_sys += systemFileName + ",";
	            
	            long fileSize = mf.getSize();
      
				FileOutputStream fs = new FileOutputStream(path + "/" + systemFileName);
				
				System.out.println(path); // 업로드 경로
				
				fs.write(mf.getBytes());
				fs.close();

			}
		}
		dto.setPhoto(photo);
		dto.setPhoto_sys(photo_sys);
		
		boolean b = usedService.UsedWrite(dto);
		
		if(b) {
			System.out.println("성공~~");
		} else {
			System.out.println("공부하자..");
		}
		
		return "redirect:/used/hello";		

	}
	
	@GetMapping(value = "/SendSms")
	@ResponseBody
	  public String sendSms(HttpServletRequest request) throws Exception {
		
		System.out.println("sendSms 도착");
		
	    String api_key = "NCSVKDEE4KHSNBFN";
	    String api_secret = "KDPVGPJQJMGFBVB4BQPRZFSAHLQF9DLM";
	  
	    
	    Coolsms coolsms = new Coolsms(api_key, api_secret);
	    
	    HashMap<String, String> set = new HashMap<String, String>();

	    set.put("to", (String)request.getParameter("to")); // 받는사람
	    set.put("from", "01024943936"); // 보내는사람
	    set.put("text", "안녕하세요 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
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
}


