package com.rhymes.app.companyadmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rhymes.app.companyadmin.model.ProductManageDto;
import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.store.dao.PurchaseDao;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.StockDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping(value = "/admin/company/*")
public class ProductManageController {

	DecimalFormat formatter = new DecimalFormat("###,###");
	
	@Autowired
	ProductManageService manage;
	
	@Autowired
	PurchaseDao store_purchase;
	
	//상품 수정
	//상품 상세조회로 이동
		@GetMapping("/productupdate")
		public String productDetailList(Principal prc, Model model, ProductDto product)throws Exception{
			
			String url = "";
		    String c_id = "";
		 	String c_name = "";
			
		 	if(prc != null) {
		     	  c_id = prc.getName();
		     	  SellerDTO seller = new SellerDTO();
		     	  seller.setId(c_id); 
		     	  seller = manage.getCname(seller);
		     	  c_name = seller.getC_name();
		     	  log.info("업체이름:" + c_name);
		     	 
		     	  if(!c_name.equals("") && c_name!=null) {
		     		  
		     		  product = store_purchase.getProductDetail(product.getP_seq());
		     		  
		     		  model.addAttribute("c_name", c_name);
		     		  model.addAttribute("pDto", product);
		     		  	
		     		  url ="productupdate";
		     		  
		     	  }else if(c_name.equals("") || c_name==null) {
		     		 url = "redirect:/main";
		     	  }
		      }else{
		    	  url = "redirect:/main";
		      }
		      
		     return url;
			
		}
	
	//상품 상세조회로 이동
	@GetMapping("/stocklist")
	public String productDetailList(Principal prc, Model model, StockDto stock)throws Exception{
		log.info("STOCKLIST P_SEQ : " + stock.getP_seq()+"");
		
		List<StockDto> slist = new ArrayList<StockDto>();
		ProductDto pDto = new ProductDto();
		
		String url = "";
	    String c_id = "";
	 	String c_name = "";
		
	 	if(prc != null) {
	     	  c_id = prc.getName();
	     	  SellerDTO seller = new SellerDTO();
	     	  seller.setId(c_id); 
	     	  seller = manage.getCname(seller);
	     	  c_name = seller.getC_name();
	     	  log.info("업체이름:" + c_name);
	     	 
	     	  if(!c_name.equals("") && c_name!=null) {
	     		  
	     		  slist = manage.getStockList(stock);
	     		  pDto = store_purchase.getProductDetail(stock.getP_seq());
	     		  
	     		  log.info("상품 디테일리스트 길이:"+ slist.size()+"");	
	     		  
	     		  model.addAttribute("c_name", c_name);
	     		  model.addAttribute("pDto", pDto);
	     		  model.addAttribute("slist", slist);	
	     		  url ="CompanyAdminStocklist";
	     		  
	     	  }else if(c_name.equals("") || c_name==null) {
	     		 url = "redirect:/main";
	     	  }
	      }else{
	    	  url = "redirect:/main";
	      }
	      
	     return url;
		
	}
	
	
	//상품 조회로 이동
    @GetMapping("/productlist")
	public String productlist(Principal prc, Model model, ProductManageDto pParam)throws Exception{
	  /* ProductParam param = new ProductParam(); */
      List<ProductDto> plist = new ArrayList<ProductDto>();
      String url = "";
      String c_id = "";
 	  String c_name = "";
      
	  
	   
 	  if(prc != null) {
     	  c_id = prc.getName();
     	  SellerDTO seller = new SellerDTO();
     	  seller.setId(c_id); 
     	  seller = manage.getCname(seller);
     	  c_name = seller.getC_name();
     	  log.info("업체이름:" + c_name);
     	 pParam.setC_name(c_name);
     	 
     	  if(!c_name.equals("") && c_name!=null) {
   
     		  //페이징
     		 int sn = pParam.getPageNumber();	//0 1 2
     		 int start = sn * pParam.getRecordCountPerPage() + 1;	
     		 int end = (sn + 1) * pParam.getRecordCountPerPage(); 
     		 int totalRecordCount = manage.getProductCnt(pParam);
     		 pParam.setStart(start);
     		 pParam.setEnd(end);
     		 
     		 plist = manage.getProductList(pParam);
     		 log.info("상품리스트 길이:"+plist.size()+"");	
     		 log.info("상품총갯수:"+totalRecordCount+"");
     		  
     		 model.addAttribute("pageNumber", sn);
     		 model.addAttribute("pageCountPerScreen", 10);
     		 model.addAttribute("recordCountPerPage", 10);
     		 model.addAttribute("totalRecordCount", pParam.getRecordCountPerPage());
     		  
     		 model.addAttribute("param", pParam);
     		 model.addAttribute("c_name", c_name);
     		 model.addAttribute("plist", plist);
     		  
     		 url = "CompanyAdminProductlist";
     	  }else if(c_name.equals("") || c_name==null) {
     		 url = "redirect:/main";
     	  }
      }else{
    	  url = "redirect:/main";
      }
      
     return url;
 	   
    }
	
	
	//상품등록 페이지로 이동
    @GetMapping("/register")
    public String register(Principal prc)throws Exception{
      
	   String c_id = "";
	   String c_name = "";
       if(prc != null) {
    	  c_id = prc.getName();
    	  System.out.println("업체 아이디 : " + c_id);
    	  SellerDTO seller = new SellerDTO();
    	  seller.setId(c_id); 
    	  seller = manage.getCname(seller);
    	  c_name = seller.getC_name();
       }
       System.out.println("업체 이름 : " + c_name);
	   
	   
	   return "CompanyAdminProductregister";
	 }
	
	//상품등록 처리
	@RequestMapping(value="/registerInsert", method = RequestMethod.POST)
    public String registerInsert(Model model, ProductDto product, StockDto stock,
      MultipartHttpServletRequest multi, HttpServletRequest req, Principal prc) throws Exception{
      
	   String c_id = "";
	   String c_name = "";
	      if(prc != null) {
	    	  System.out.println("업체 아이디 : " + c_id);
	    	  c_id = prc.getName();
	    	  
	    	  SellerDTO seller = new SellerDTO();
	    	  seller = manage.getCname(seller);
	    	  c_name = seller.getC_name();
	      }
	   
	   product.setC_name(c_name);
      
     int p_seq = manage.getPseq();
           
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
         boolean bool1 = manage.insertProduct(product);
         if (bool1) {
            System.out.println("product insert 성공!!");

            // stock INSERT
            String sizeArr[] = stock.getP_size().split("/");
            String quArr[] = stock.getP_quantity2().split("/");
            for (int i = 0; i < quArr.length; i++) {
               stock.setP_seq(p_seq);
               stock.setP_size(sizeArr[i]);
               stock.setP_quantity(Integer.parseInt(quArr[i]));
               boolean bool2 = manage.insertStock(stock);
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
      return "redirect:/admin/company/main";
   }
  // 상품 수정/삭제로 이동
	//상품 조회로 이동
    @GetMapping("/productoperlist")
	public String productoperlist(Principal prc, Model model, ProductManageDto pParam)throws Exception{
	  /* ProductParam param = new ProductParam(); */
      List<ProductDto> plist = new ArrayList<ProductDto>();
      String url = "";
      String c_id = "";
 	  String c_name = "";
      
	  
	   
 	  if(prc != null) {
     	  c_id = prc.getName();
     	  SellerDTO seller = new SellerDTO();
     	  seller.setId(c_id); 
     	  seller = manage.getCname(seller);
     	  c_name = seller.getC_name();
     	  log.info("업체이름:" + c_name);
     	 pParam.setC_name(c_name);
     	 
     	  if(!c_name.equals("") && c_name!=null) {
   
     		  //페이징
     		 int sn = pParam.getPageNumber();	//0 1 2
     		 int start = sn * pParam.getRecordCountPerPage() + 1;	
     		 int end = (sn + 1) * pParam.getRecordCountPerPage(); 
     		 int totalRecordCount = manage.getProductCnt(pParam);
     		 pParam.setStart(start);
     		 pParam.setEnd(end);
     		 
     		 plist = manage.getProductList(pParam);
     		 log.info("상품리스트 길이:"+plist.size()+"");	
     		 log.info("상품총갯수:"+totalRecordCount+"");
     		  
     		 model.addAttribute("pageNumber", sn);
     		 model.addAttribute("pageCountPerScreen", 10);
     		 model.addAttribute("recordCountPerPage", 10);
     		 model.addAttribute("totalRecordCount", pParam.getRecordCountPerPage());
     		  
     		 model.addAttribute("param", pParam);
     		 model.addAttribute("c_name", c_name);
     		 model.addAttribute("plist", plist);
     		  
     		 url = "CompanyAdminProductOpertlist";
     	  }else if(c_name.equals("") || c_name==null) {
     		 url = "redirect:/main";
     	  }
      }else{
    	  url = "redirect:/main";
      }
      
     return url;
 	   
    }
	
}
