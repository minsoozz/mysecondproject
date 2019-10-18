package com.rhymes.app.store.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.store.model.BasketDto;
import com.rhymes.app.store.model.BasketListDto;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.WishlistDto;
import com.rhymes.app.store.model.category.Category1Dto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;
import com.rhymes.app.store.service.PurchaseService;
import com.rhymes.app.store.service.StoreService;
import com.rhymes.app.used.Service.UsedService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping("/store")
public class StoreController {
   
   @Autowired HttpServletRequest req;
   @Autowired StoreService store;
   @Autowired ProductManageService productmanage;
   @Autowired PurchaseService purchase;
   @Autowired UsedService usedService;
   
   DecimalFormat formatter = new DecimalFormat("###,###");
   
	/*
	 * private static final String[] IP_HEADER_CANDIDATES = { "X-Forwarded-For",
	 * "Proxy-Client-IP", "WL-Proxy-Client-IP", "HTTP_X_FORWARDED_FOR",
	 * "HTTP_X_FORWARDED", "HTTP_X_CLUSTER_CLIENT_IP", "HTTP_CLIENT_IP",
	 * "HTTP_FORWARDED_FOR", "HTTP_FORWARDED", "HTTP_VIA", "REMOTE_ADDR" }; public
	 * static String getClientIpAddress(HttpServletRequest request) { for (String
	 * header : IP_HEADER_CANDIDATES) { String ip = request.getHeader(header); if
	 * (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) { return
	 * ip; } } return request.getRemoteAddr(); }
	 */
   
   // 상품 리스트   
   @GetMapping("/productList")
   public String productList(Model model, ProductParam param) throws Exception{
	  
      // SORTING DEFAULT
      if( param.getSorting()==null||("").equals(param.getSorting()) ) {
    	param.setSorting("NEW");  
      }
      
      // 업체 리스트 GET
      List<String> clist = store.getCompnayList();   
      // 1차 카테고리 리스트 초기화
      List<Category1Dto> cate1list = new ArrayList<Category1Dto>();
      // 2차 카테고리 리스트 초기화
      List<Category2Dto> cate2list = new ArrayList<Category2Dto>();
      
      // 1차카테고리 존재할 때
      if(param.getC1_name()!=null && !param.getC1_name().equals("")) {
         // 카테고리 선택/검색해서 들어갈 때, 1차 카테고리 리스트 GET
         if(param.getKeyword()!=null && param.getKeyword()!= "") {
            if(param.getC1_name().equals("MEN")) {
               param.setC1_seq(1);
            }else if(param.getC1_name().equals("WOMEN")) {
               param.setC1_seq(2);
            }
            cate2list = store.getkCate2List(param);
         // HEADER에서 클릭해서 1차카테고리만 가지고 들어갈 때, 1차 카테고리 리스트 GET   
         }else{
            if(param.getC1_name().equals("MEN")) {
               cate2list = productmanage.getCate2List(1);
            }else if(param.getC1_name().equals("WOMEN")) {
               cate2list = productmanage.getCate2List(2);
            }
         }
      // 브랜드 클릭 + 카테고리1 선택없이 전체검색시 카테고리 리스트 설정
      }else if(param.getC1_name()==null || param.getC1_name().equals("")){
         cate1list = store.getkCate1List(param);
         model.addAttribute("cate1list", cate1list);         
      }
      log.info("KEYWORD : " + param.getKeyword());
      
      // paging 처리
      int sn = param.getPageNumber(); 
      int start = sn * param.getRecordCountPerPage() + 1; 
      int end = (sn + 1) * param.getRecordCountPerPage();
      param.setStart(start);
      param.setEnd(end);
            
      // 상품 총갯수
      int totalProduct = store.getProductCnt(param);
      
      // 상품 리스트
      List<ProductDto> plist = store.getProductList(param);
      
      for (int i = 0; i < plist.size(); i++) {
         int price = plist.get(i).getP_price();
         plist.get(i).setP_price2(formatter.format(price));
      }
      
      // OPTIONS
      model.addAttribute("sorting", param.getSorting());
      model.addAttribute("criterion", param.getCriterion());
      model.addAttribute("keyword", param.getKeyword());
      //left nav
      model.addAttribute("cate2list", cate2list);
      model.addAttribute("clist", clist);
      model.addAttribute("c1_name", param.getC1_name());
      model.addAttribute("c2_name", param.getC2_name());
      model.addAttribute("c3_name", param.getC3_name());
      //페이징
      model.addAttribute("pageNumber", sn);
      model.addAttribute("totalRecordCount", totalProduct);
      model.addAttribute("pageCountPerScreen", 10);
      model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
      //상품 리스트   
      model.addAttribute("plist", plist);
      
      return "productList.tiles";
   }
   
   // 2차카테고리 AJAX(SORTING left-navi)
   @ResponseBody
   @GetMapping("/kCate2List")
   public List<Category2Dto> getkCate2List(ProductParam param) throws Exception{
      List<Category2Dto> cate2list = store.getkCate2List(param);
      return cate2list;
   }
   // 3차카테고리 AJAX(SORTING left-navi)   
   @ResponseBody
   @GetMapping("/kCate3List")
   public List<Category3Dto> getkCate3List(ProductParam param) throws Exception{
      List<Category3Dto> cate3list = store.getkCate3List(param);
      return cate3list;
   }
   
   // 2차카테고리 AJAX(COMPANY ADMIN X 일반left-navi)
   @ResponseBody
   @GetMapping("/cate2List")
   public List<Category2Dto> getCate2List(int c1_seq) throws Exception{
      List<Category2Dto> cate2list = productmanage.getCate2List(c1_seq);
      return cate2list;
   }
   
   // 3차카테고리 AJAX(COMPANY ADMIN X 일반left-navi)
   @ResponseBody
   @GetMapping("/cate3List")
   public List<Category3Dto> getCate3List(int c2_seq) throws Exception{
      List<Category3Dto> cate3list = productmanage.getCate3List(c2_seq);
      return cate3list;
   }

   // 2차카테고리 선택 -> 해당 카테고리 사이즈단위 생성 후 리턴(AJAX)
   @ResponseBody
   @GetMapping("/sizeUnit")
   public List<String> sizeUnit(String c2_seq) throws Exception{
      int c2_seq2 = Integer.parseInt(c2_seq);
      
      String[] sizeUnits = productmanage.getSizeunit(c2_seq2).split("/");
      List<String> list = Arrays.asList(sizeUnits);
     
      return list;
   }
   
   // 상품 상세정보 페이지로 이동
   @RequestMapping(value="/productDetail", method = RequestMethod.GET)
   public String productDetail(Model model, ProductDto product, Principal prc, HttpServletRequest req) throws Exception{
      
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      List<StockDto> sizelist = purchase.getSizeList(product.getP_seq());
      
      ProductDto productDto = purchase.getProductDetail(product.getP_seq());
      productDto.setP_price2(formatter.format(productDto.getP_price()));
      
    // 위시리스트 중복 체크
       WishlistDto wish = new WishlistDto();
       //접속 ID GET
       wish.setId(userId);
       wish.setP_seq(product.getP_seq());
       boolean wishChk = purchase.chkWishlist(wish);
      
    //left nav
       model.addAttribute("c1_name", product.getC1_name());
       // 브랜드 리스트
       List<String> clist = store.getCompnayList();    
       model.addAttribute("clist", clist);
       // 2차 카테고리 리스트
       List<Category2Dto> cate2list = new ArrayList<Category2Dto>();
       
       if(product.getC1_name() != "" || product.getC1_name() != null) {
         if(product.getC1_name().equals("MEN")) {
            cate2list = productmanage.getCate2List(1);
         }else if(product.getC1_name().equals("WOMEN")) {
            cate2list = productmanage.getCate2List(2);
         }
       }
       
       model.addAttribute("userId", userId);
       model.addAttribute("cate2list", cate2list);
       model.addAttribute("wishChk", wishChk);
       model.addAttribute("sizelist", sizelist);
       model.addAttribute("productDto", productDto);
      
      return "productDetail.tiles";
   }
   
   // 상품상세페이지에서 WISHLIST-BTN EVENT(AJAX)
   @ResponseBody
   @GetMapping("/operWishlist")
   public String insertWishlist(WishlistDto wish, Principal prc) throws Exception {
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      String str = "";
      
      //세션에서 아이디 담아야함(수정필요)
      wish.setId(userId);
      
      // 단일상품의 위시리스트 버튼을 이미 클릭했는지 확인 후 분기
      boolean wishChk = purchase.chkWishlist(wish);
      
      // 위시리스트에 존재하는 경우
      if(wishChk) {
         boolean deleteBool = purchase.deleteWishlist(wish);
         if(deleteBool) {
            str = "delete";            
         }else {
            str = "제거 실패ㅠ";
         }
      // 위시리스트에 존재하지 않는 경우   
      }else {
         boolean insertBool = purchase.insertWishlist(wish);
         
         if(insertBool) {
            str = "insert";
         }else {
            str ="등록 실패 ㅎ";
         }
      }
      return str;
   }
   
   
   
   
   //재입고 신청 INSERT EVENT(AJAX)
   @ResponseBody
   @GetMapping("/restockNotify_insert")
   public String restockNotify_insert(Principal prc, RestockNotifyDto restock) throws Exception {

	  String msg = "";
	  String userId = "";
      // 로그인이 되어있을 때
	  if(prc != null) {
         userId = prc.getName();
         restock.setId(userId);
         
        	boolean rnChk = purchase.chkRestockN(restock);
        	// 재입고 테이블에 존재할 때
        	if(rnChk) {
        		msg = "already";
        	}
        	else {
        		boolean bool = purchase.insertRestockN(restock);
        		if(bool) {
        			msg = "insert";
        		}
        	}
      }
	  
      return msg;
   }
   
}
