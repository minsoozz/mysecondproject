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
   
   @Autowired
   HttpServletRequest req;
   
   @Autowired
   StoreService store;
   
   @Autowired
   ProductManageService productmanage;

   @Autowired
   PurchaseService purchase;
   
   @Autowired 
   UsedService usedService;
   
   DecimalFormat formatter = new DecimalFormat("###,###");
   
   // IP ARRAY
   private static final String[] IP_HEADER_CANDIDATES = { 
		    "X-Forwarded-For",
		    "Proxy-Client-IP",
		    "WL-Proxy-Client-IP",
		    "HTTP_X_FORWARDED_FOR",
		    "HTTP_X_FORWARDED",
		    "HTTP_X_CLUSTER_CLIENT_IP",
		    "HTTP_CLIENT_IP",
		    "HTTP_FORWARDED_FOR",
		    "HTTP_FORWARDED",
		    "HTTP_VIA",
		    "REMOTE_ADDR" };
   // IP ADRESS GET FUNCTION
	public static String getClientIpAddress(HttpServletRequest request) {
	    for (String header : IP_HEADER_CANDIDATES) {
	        String ip = request.getHeader(header);
	        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
	            return ip;
	        }
	    }
	    return request.getRemoteAddr();
	}
   
   
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
   
   //일반 장바구니(AJAX) : 로그인 접속 되어있을 때
   @ResponseBody
   @GetMapping("/insertBasket")
   public List<BasketListDto> insertBasket(BasketDto basket, Principal prc)throws Exception{
	  
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      basket.setId(userId);
      
      String str = "";
      // 장바구니 중복 체크
      boolean bool1 = purchase.chkBasket(basket);
      	
      if(bool1) {
         
         // BASKET DB TABLE에 아이디 존재여부 BOOLEAN값 RETURN	
         int n = purchase.updateBaksetQ(basket);
         // 이미 STOCK SEQ를 접속 ID가 가지고 DB테이블에서 가지고 있다면 수량UPDATE 
         if(n==1) {
            log.info("장바구니 수량 UPDATE 성공");
         }
      }else {
         try {
            boolean bool2 = purchase.insertBasket(basket);
            if(bool2) {
            	log.info("장바구니 INSERT 성공");
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
      List<BasketListDto> blist= purchase.getBasketList(userId);
      
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      for (int i = 0; i < blist.size(); i++) {
         int price = blist.get(i).getP_price();
         blist.get(i).setP_price2(formatter.format(price));
         // 총액 결제 금액 계산
         unitPrice = blist.get(i).getP_price();
         basketPcnt = blist.get(i).getP_quantity();
         //제품 단가 * 재고번호 수량
         total_price += (unitPrice * basketPcnt);
      }
      blist.get(0).setTotal_price(formatter.format(total_price));
      
      return blist;
   }
   
   // 비회원 SESSION 장바구니 (AJAX)
   @ResponseBody
   @GetMapping("/insertSessionBasket")
   public List<BasketListDto> insertCookieBasket(BasketDto basket, Principal prc,
		   HttpServletRequest request)throws Exception{
	   
	   HttpSession session = request.getSession();
	   
	   String ip = null;
       ip = getClientIpAddress(request);
       log.info("CLIENT IP : " + ip);
	   
       // 최초 생성 SESSION 리스트
       List<BasketDto> cBasketList = new ArrayList<BasketDto>();
	   // 복사용 SESSION 리스트
       List<BasketDto> cBasketList2 = new ArrayList<BasketDto>();
	   // FINAL 리스트
	   List<BasketDto> cBasketList3 = new ArrayList<BasketDto>();
	   // DB값 가져와서 BASKETLIST-DTO를 담을 리스트
	   List<BasketListDto> cBasketList4 = new ArrayList<BasketListDto>();
	   // 리스트4에 담을 DTO
	   BasketListDto basketlistDto = new BasketListDto();	   

	   Boolean test = true;

	   if(prc == null) {
            // 클라이언트IP SESSION 리스트가 존재하지 않을 때, 생성하면서 INSERT
            if((List<BasketDto>)session.getAttribute(ip) == null) {
               cBasketList.add(basket);
                //SESSION 생성,저장
               session.setAttribute(ip, cBasketList);
            // SESSION 리스트가 존재할 때, 기존 SESSION 리스트를 새롭게 생성한 저장 SESSION 리스트에 옮겨담고 INSERT
            } else {
               cBasketList = (List<BasketDto>)session.getAttribute(ip);
               //SESSION 전체 옮겨담기
               cBasketList2.addAll(cBasketList);
               
               // 기존 SESSION 리스트에 이미 담겨있는 STOCK SEQ가 있는 체크
               for (int i = 0; i < cBasketList2.size(); i++) {
                  int stock_seq = cBasketList2.get(i).getStock_seq();

                  // 이미 담겨있는 STOCK SEQ가 존재할 때, 수량 UPDATE하고 저장 SESSION 리스트로 DTO 옮겨담기
                  if(stock_seq == basket.getStock_seq()) {
                     cBasketList2.get(i).setP_quantity(basket.getP_quantity());
                     test = false;
                  }
              }
               // 기존 SESSION 리스트에 STOCK_SEQ가 담겨있지 않는 경우   
               if(test == true) {  
                  cBasketList2.add(basket);
               }
    
               // IP SESSION 제거
               session.removeAttribute(ip);
               // 다시 IP SESSION 생성하고 합체한 임시저장 리스트를 저장 
               session.setAttribute(ip, cBasketList2);
               session.setMaxInactiveInterval(86400*3); //30일
            }
            
            // FINAL IP SESSION LIST(1+2)
            cBasketList3 = (List<BasketDto>)session.getAttribute(ip);

            // SESSION 장바구니 리스트-DTO(STOCK SEQ, QUANTITY)에 담긴 STOCK SEQ를 꺼내온 다음, 
            // PARAMETER로 STOCK SEQ를 넣어서 PRODUCT,STOCK(JOIN) 장바구니 리스트에 뿌릴 필요한정보를 가져온 다음,
            // 장바구니 페이지에서 필요한 정보들을 담은 DTO를 새로운 리스트에 담는다.
            for (int i = 0; i < cBasketList3.size(); i++) {
            	basketlistDto = purchase.getSessionBasketDto(cBasketList3.get(i).getStock_seq());
            	basketlistDto.setP_quantity(cBasketList3.get(i).getP_quantity());
            	cBasketList4.add(basketlistDto);
			}
            
            int unitPrice = 0;
            int basketPcnt = 0;
            int total_price = 0;
            int quantity = 0; /*재고수량*/
            
            for (int i = 0; i < cBasketList4.size(); i++) {
            	int price = cBasketList4.get(i).getP_price();
            	// 단가
            	unitPrice = cBasketList4.get(i).getP_price();
                // 장바구니 수량
            	basketPcnt = cBasketList4.get(i).getP_quantity();
                // 재고수량
            	quantity = cBasketList4.get(i).getQuantity();
            	if(quantity != 0) {
                    //제품 단가 * 장바구니 수량
                    total_price += (unitPrice * basketPcnt);
                    cBasketList4.get(i).setP_price2(formatter.format(price));
                 }else if(quantity == 0) {
                	 cBasketList4.get(i).setP_price2("SOLD OUT");
                 }
            	
            }
            
            cBasketList4.get(0).setTotal_price(formatter.format(total_price));
            cBasketList4.get(0).setTotal_price2(total_price);
         }   
        return cBasketList4;
     }
   		
	   // 장바구니 전체삭제 EVENT(AJAX)
	  @ResponseBody
	  @GetMapping("/deleteSessionBasketAll")
	  public String deleteSessionBasketAll(Principal prc, HttpServletRequest request) throws Exception{      
		  HttpSession session = request.getSession();
		  String ip = null;
		  ip = getClientIpAddress(request);
		  session.removeAttribute(ip);
	      
	      return "DELETE";
	   }	
   
   	  // SESSION 장바구니 DELETE EVENT(AJAX)
	  @ResponseBody
	  @GetMapping("/deleteSessionBasket")
	  public int deleteSessionBasket(int stock_seq, Principal prc, HttpServletRequest request) throws Exception{      
		  HttpSession session = request.getSession();
		  String ip = null;
		  ip = getClientIpAddress(request);
		  
		  log.info("장바구니 삭제 STOCKSEQ : " + stock_seq + "");
		  
		  // 기존 SESSION 리스트(DTO-STOCKSEQ, QUANTITY)
		  List<BasketDto> sessionList = new ArrayList<BasketDto>();
		  // 복제 리스트(DELETE STOCKSEQ 제외하고 옮겨담을 리스트)
		  List<BasketDto> sessionList2 = new ArrayList<BasketDto>();
		  // FINAL 리스트
		  List<BasketDto> sessionList3 = new ArrayList<BasketDto>();
		  // 복제리스트 STOCK SEQ로 DB접근해서 BASKETLIST-DTO를 담을 리스트 
		  List<BasketListDto> blist = new ArrayList<BasketListDto>();
		  // blist에 담을 DTO 선언
		  BasketListDto basketlistDto = new BasketListDto();
		  
		  int unitPrice = 0;
		  int basketPcnt = 0;
		  int total_price = 0;
		  int quantity = 0;
		  
		  Boolean test = true;

		 
		  sessionList = (List<BasketDto>)session.getAttribute(ip);
	       //SESSION 전체 옮겨담기
		  sessionList2.addAll(sessionList);
	       
	      // 기존 SESSION 리스트에 이미 담겨있는 STOCK SEQ가 있는 체크
	      for (int i = 0; i < sessionList2.size(); i++) {
	         int session_stockseq = sessionList2.get(i).getStock_seq();
	
	         // 삭제버튼을 누르면 STOCK_SEQ와 세션리스트에 있는 DTO에 담긴 STOCK_SEQ가 일치하면 DTO삭제
	          if(stock_seq == session_stockseq) {
	        	  sessionList2.remove(i);
	             test = false;
	          }
	      }
	
	       // IP SESSION 제거
	       session.removeAttribute(ip);
	       // 다시 IP SESSION 생성하고 임시저장 리스트를 저장 
	       session.setAttribute(ip, sessionList2);
	       session.setMaxInactiveInterval(86400*3); //30일
		    
		   // FINAL IP SESSION LIST(1+2)
	       sessionList3 = (List<BasketDto>)session.getAttribute(ip);
	       
	       log.info("삭제 후 세션 장바구니리스트 사이즈 : " + sessionList3.size() + "");
		  
	       for (int i = 0; i < sessionList3.size(); i++) {
	           	basketlistDto = purchase.getSessionBasketDto(sessionList3.get(i).getStock_seq());
	           	basketlistDto.setP_quantity(sessionList3.get(i).getP_quantity());
	           	blist.add(basketlistDto);
			}
	       
		   for (int i = 0; i< blist.size(); i++) {
		    	int price = blist.get(i).getP_price();
		    	blist.get(i).setP_price2(formatter.format(price)); 
		    	unitPrice =	blist.get(i).getP_price(); 
		    	basketPcnt = blist.get(i).getP_quantity();
		    	quantity = blist.get(i).getQuantity(); 
		    	
		    	if(quantity != 0) { //제품 단가 * 재고번호 수량
		    		total_price += (unitPrice * basketPcnt);
		    	}
		     }
		  
		  return total_price;
	  }

   
   
   // 장바구니 페이지로 이동
   @GetMapping("/basket")
   public String basket(Model model, Principal prc, HttpServletRequest request)throws Exception {
      String url = "";
	  String userId = "";
      
      HttpSession session = request.getSession();
      String ip = null;
      ip = getClientIpAddress(request);
      log.info("IP : " + ip);
  

   //1.로그인O(회원 : 일반 장바구니 리스트(ID로 DB에서 PRODUCT,STOCK정보를 담은 DTO를 담을 리스트) 
   //   OR 
   //2.로그인X(비회원 : SESSION 리스트2-DTO(리스트1 STOCKSEQ로 DB에서 PRODUCT,STOCK정보를 담은 DTO를 담을 리스트)   
      List<BasketListDto> blist = new ArrayList<BasketListDto>();
      
   //2.로그인X(비회원)
      //SESSION 리스트1-DTO(STOCKSEQ, BASKET QUANTITY)
      List<BasketDto> sessionList1 = new ArrayList<BasketDto>();
      //SESSION 리스트1에서 리스트2로 이사할 때, 필요한 BASKET-LIST DTO
      BasketListDto basketlistDto = new BasketListDto();
      
      //로그인O
      if(prc != null) {
         userId = prc.getName();
         blist= purchase.getBasketList(userId);
      }
      //로그인X
      else{
    	  if(session.getAttribute(ip) != null) {
	          sessionList1 = (List<BasketDto>)session.getAttribute(ip);
	          log.info("session.getAttribute(ip) != null");
	    	  
	    	  for (int i = 0; i < sessionList1.size(); i++) {
	          	basketlistDto = purchase.getSessionBasketDto(sessionList1.get(i).getStock_seq());
	          	basketlistDto.setP_quantity(sessionList1.get(i).getP_quantity());
	          	blist.add(basketlistDto);
	          	
	          	
			  }
    	  }else if(session.getAttribute(ip) == null) {
    		  log.info("session.getAttribute(ip) == null");
    		  blist = null;
    	  }
      }
      
      
      // 금액 COMMA + 총액 계산
      if(blist != null) {
	      int unitPrice = 0;
	      int basketPcnt = 0;
	      int total_price = 0;
	      int quantity = 0; /*재고수량*/
	      
	      for (int i = 0; i < blist.size(); i++) {
	      // 3자리 , 찍어주기 
	    	 int price = blist.get(i).getP_price();
	      // 총액 결제 금액 계산
	         unitPrice = blist.get(i).getP_price();
	         basketPcnt = blist.get(i).getP_quantity();
	         quantity = blist.get(i).getQuantity();
	         // 장바구니에 있는 제품이 품절이 아니면
	         if(quantity != 0) {
	            //총 금액 = 제품 단가 * 장바구니 수량
	        	 blist.get(i).setP_price2(formatter.format(price));
	            total_price += (unitPrice * basketPcnt);
	         }else {
	        	 blist.get(i).setP_price2("SOLD OUT");
	         }
	      }
	      
	      blist.get(0).setTotal_price(formatter.format(total_price));
	      blist.get(0).setTotal_price2(total_price);
      }
      
      
      model.addAttribute("blist", blist);
      
      if(session.getAttribute(ip) != null && prc != null) {
    	  url = "basket.tiles";    	  
      }else if(session.getAttribute(ip) == null || prc == null) {
    	  url = "sessionbasket.tiles";
      }
      
      return url;
   
   }
   

   // 장바구니 DELETE EVENT(AJAX)
   @ResponseBody
   @GetMapping("/deleteBasket")
   public int deleteBasket(int b_seq, Principal prc) throws Exception{      
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      int quantity = 0;
      
      try {
         purchase.deleteBasket(b_seq);
         
         List<BasketListDto> blist= purchase.getBasketList(userId);
         for (int i = 0; i < blist.size(); i++) {
            int price = blist.get(i).getP_price();
            blist.get(i).setP_price2(formatter.format(price));
            unitPrice = blist.get(i).getP_price();
            basketPcnt = blist.get(i).getP_quantity();
            quantity = blist.get(i).getQuantity();
            if(quantity != 0) {
               //제품 단가 * 재고번호 수량
               total_price += (unitPrice * basketPcnt);
            }            
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return total_price;
   }
   
   // 장바구니 전체삭제 EVENT(AJAX)
   @ResponseBody
   @GetMapping("/deleteBasketAll")
   public String deleteBasket(Principal prc) throws Exception{      
       String str = "";
	   String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      BasketDto basket = new BasketDto();
      basket.setId(userId);
      
      try {
         int n = purchase.deleteBasektAll(basket);
         if(n>1) {
            log.info("장바구니전체삭제 성공");
            str = "DELETE";
         }
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      return str;
   }
   
   // 장바구니 수량변경 EVENT(AJAX)
   @ResponseBody
   @GetMapping("/updateBasketQ")
   public int updateBasketQ(BasketDto basket, Principal prc) throws Exception{
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      int quantity = 0;
      
      basket.setId(userId);
      
      try {
         int n = purchase.updateBaksetQ(basket);
   
         if(n==1) {
            List<BasketListDto> blist= purchase.getBasketList(userId);
            for (int i = 0; i < blist.size(); i++) {
               int price = blist.get(i).getP_price();
               blist.get(i).setP_price2(formatter.format(price));
               unitPrice = blist.get(i).getP_price();
               basketPcnt = blist.get(i).getP_quantity();
               quantity = blist.get(i).getQuantity();
               
               if(quantity!=0) {
                  //제품 단가 * 재고번호 수량
                  total_price += (unitPrice * basketPcnt);
               }
            }
         }else {
            log.info("수량변경 실패");
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return total_price;
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
