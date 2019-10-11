package com.rhymes.app.common.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileManageController {
	
	@ResponseBody
	@RequestMapping(value = "/ck/fileupload", method = {RequestMethod.POST, RequestMethod.GET})
	public String fileUpload(Model model,  
	        @RequestParam(value="upload", required = false) MultipartFile fileload) {
		
		System.out.println(fileload.getOriginalFilename());
		
		JSONObject outData = new JSONObject();
		outData.put("uploaded", true);
		outData.put("url", "http://localhost/upload/store/15704428782241.jpeg");
		 
		return "{ \"uploaded\" : true, \"url\" : \"http://192.168.0.14:18080/upload/store/15704428782241.png\" }";
	}
}
