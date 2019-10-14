package com.rhymes.app.companyadmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rhymes.app.companyadmin.service.ProductRegisterService;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.StockDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping("/companyadmin")
public class ProductRegisterController {

	DecimalFormat formatter = new DecimalFormat("###,###");
	
	@Autowired
	ProductRegisterService register;
	
	@GetMapping("/register")
	   public String register(Principal prc)throws Exception{
	      
		   String c_id = "";
		   String c_name = "";
		      if(prc != null) {
		    	  c_id = prc.getName();
		    	  System.out.println("업체 아이디 : " + c_id);
		    	  SellerDTO seller = new SellerDTO();
		    	  seller.setId(c_id); 
		    	  seller = register.getCname(seller);
		    	  c_name = seller.getC_name();
		      }
	       System.out.println("업체 아이디 : " + c_name);
		   
		   
		   return "register.tiles";
	 }
	
	@RequestMapping(value="/registerInsert", method = RequestMethod.POST)
    public String registerInsert(Model model, ProductDto product, StockDto stock,
      MultipartHttpServletRequest multi, HttpServletRequest req, Principal prc) throws Exception{
      
	   String c_id = "";
	   String c_name = "";
	      if(prc != null) {
	    	  System.out.println("업체 아이디 : " + c_id);
	    	  c_id = prc.getName();
	    	  
	    	  SellerDTO seller = new SellerDTO();
	    	  seller = register.getCname(seller);
	    	  c_name = seller.getC_name();
	      }
	   
	   product.setC_name(c_name);
      
     int p_seq = register.getPseq();
           
      String path = req.getServletContext().getRealPath("/upload/store");
      System.out.println("path : " + path);
      String fileName = "";
      
      File dir = new File(path);
      if(!dir.isDirectory()) {
         dir.mkdir();
      }
      Iterator<String> files = multi.getFileNames();
      
      
      int cnt = 0;
      while(files.hasNext()) {
         String uploadFile = files.next();
         
         MultipartFile mFile = multi.getFile(uploadFile);
         fileName = mFile.getOriginalFilename();
         System.out.println("파일이름 : " + fileName);
         String timeFileName = System.currentTimeMillis() + fileName;
         System.out.println("시간파일이름 : " + timeFileName);
         cnt++;
         
         if(cnt == 1) {
           product.setPhoto1_file(timeFileName);
         }
         if(cnt == 2) {
            product.setPhoto2_file(timeFileName);
          }
         if(cnt == 3) {
            product.setPhoto3_file(timeFileName);
          }
         if(cnt == 4) {
            product.setPhoto4_file(timeFileName);
          }
         if(cnt == 5) {
            product.setPhoto5_file(timeFileName);
          }
        
         try {
            FileOutputStream fs = new FileOutputStream(path + "/" + timeFileName);
            fs.write(mFile.getBytes());
            System.out.println("cnt : " + cnt);
            fs.close();
            
            product.setP_seq(p_seq);
            stock.setP_seq(p_seq);
            
            System.out.println("!!");
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
      
      try {
         // product INSERT
         boolean bool1 = register.insertProduct(product);
         if (bool1) {
            System.out.println("product insert 성공!!");

            // stock INSERT
            String sizeArr[] = stock.getP_size().split("/");
            String quArr[] = stock.getP_quantity2().split("/");
            for (int i = 0; i < quArr.length; i++) {
               stock.setP_seq(p_seq);
               stock.setP_size(sizeArr[i]);
               stock.setP_quantity(Integer.parseInt(quArr[i]));
               boolean bool2 = register.insertStock(stock);
               if (bool2) {
                  System.out.println("[" + sizeArr[i] + "사이즈] stock insert 성공!!");
               }
            }
         } else {
            System.out.println("product insert 실패");	
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "redirect:/main";
   }
	
	
}
