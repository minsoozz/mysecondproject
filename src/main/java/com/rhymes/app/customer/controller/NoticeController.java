package com.rhymes.app.customer.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileDeleteStrategy;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;
import com.rhymes.app.customer.service.NoticeService;
import com.rhymes.app.customer.util.FUpUtil;
import com.rhymes.app.customer.util.FileDelete;


 
@Controller
@RequestMapping("/Rhymes")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService NoticeService;
	
	@GetMapping("/main")
	public String main() {
		
		return "redirect:/Rhymes/noticelist";
	}
	
	
	@RequestMapping(value = "/noticelist", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticelist(Model model, CustomerParam param){
		
		model.addAttribute("doc_title", "공지사항");
		model.addAttribute("doc_sub", "라임의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.");
		
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<NoticeDto> noticelist = NoticeService.getNoticeList(param);
		
		//글의 총수
		int totalRecordCount = NoticeService.getNoticeCount(param);
		model.addAttribute("noticelist", noticelist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		// 추가
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
				
		
		return "noticelist.tiles";
	}
	
	
	@GetMapping("/noticedetail")
	public String noticedetail(int seq,Model model) {
		
		model.addAttribute("doc_title", "공지사항");
		model.addAttribute("doc_sub", "라임의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.");
		
		
		NoticeService.NoticeUpRead(seq);
		NoticeDto noticedto = NoticeService.getNoticeDetail(seq);
		
		model.addAttribute("noticedto", noticedto);

		return "noticedetail.tiles";
	}
	
	@GetMapping("/noticewrite")
	public String noticewrite(Model model) {
		model.addAttribute("doc_title", "공지사항");
		model.addAttribute("doc_sub", "라임의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.");
		
		
		return "noticewrite.tiles";
	} 
	
	//글저장 
	@RequestMapping(value = "/noticeupload", method = RequestMethod.POST)
	public String noticeupload(NoticeDto noticedto,
			@RequestParam(value = "fileload", required = false)MultipartFile fileload,
			HttpServletRequest req) {
		
		
		String filename = fileload.getOriginalFilename();	//mydata
		noticedto.setFilename(filename);
		
		// upload 
		
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// �뤃�뜑
		// String fupload = "d:\\tmp";
		
		System.out.println("_fupload:" + fupload);	//�뾽濡쒕뱶 �쐞移�
		
		// file
		String f = noticedto.getFilename();
		String newfilename = FUpUtil.getNewFileName(f);
		
		
		//	
		noticedto.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		
		try {
			//
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db
			NoticeService.NoticeUpload(noticedto);
			
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/Rhymes/noticelist";
	}
	
	//글수정가기
	@GetMapping("/noticeupdate")
	public String noticeupdate(int seq, Model model) {
		
		model.addAttribute("doc_title", "공지사항");
		model.addAttribute("doc_sub", "라임의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.");
		
		
		NoticeDto noticedto = NoticeService.getNoticeDetail(seq);
		
		model.addAttribute("noticedto", noticedto);
		
		return "noticeupdate.tiles";
	}
	
	//글수정하기
	@RequestMapping(value = "/noticeupdateAf", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeupdateAf(NoticeDto noticedto,
			@RequestParam(value = "file1", required = false)MultipartFile file1,
			HttpServletRequest req) {
		
		
		if (file1.isEmpty()) {
			
			NoticeService.NoticeUpdateAf(noticedto);
		}else {
			
			String filename = file1.getOriginalFilename();	//mydata
			noticedto.setFilename(filename);
			
			// upload 
			String fupload = req.getServletContext().getRealPath("/upload");
			
			
			System.out.println("_fupload:" + fupload);	//�뾽濡쒕뱶 �쐞移�
			
			// file
			String f = noticedto.getFilename();
			String newfilename = FUpUtil.getNewFileName(f);
			
			
			//	
			noticedto.setFilename(newfilename);
			
			File file = new File(fupload + "/" + newfilename);
			
			try {
				//
				FileUtils.writeByteArrayToFile(file, file1.getBytes());
				
				// db
				NoticeService.NoticeUpdateAf(noticedto);
				
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		
		
		return "redirect:/Rhymes/noticelist";
	}
	
	
	//삭제하기
	@GetMapping("/noticedelete")
	public String noticedelete(int seq, HttpServletRequest req) {
		
		String filename = NoticeService.getfilename(seq);
		String fupload = req.getServletContext().getRealPath("/upload");
		FileDelete.main(fupload + "/" + filename);
		 
		
		boolean b = NoticeService.NoticeDelete(seq);
		if(b) {
			return "redirect:/Rhymes/noticelist";
		}
		
		return "redirect:/Rhymes/noticelist";
	}
	
}
