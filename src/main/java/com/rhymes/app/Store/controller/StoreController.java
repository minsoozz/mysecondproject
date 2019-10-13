package com.rhymes.app.Store.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rhymes.app.Store.model.BasketDto;
import com.rhymes.app.Store.model.BasketListDto;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.ProductParam;
import com.rhymes.app.Store.model.RestockNotifyDto;
import com.rhymes.app.Store.model.StockDto;
import com.rhymes.app.Store.model.WishlistDto;
import com.rhymes.app.Store.model.category.Category1Dto;
import com.rhymes.app.Store.model.category.Category2Dto;
import com.rhymes.app.Store.model.category.Category3Dto;
import com.rhymes.app.Store.service.PurchaseService;
import com.rhymes.app.Store.service.RegisterService;
import com.rhymes.app.Store.service.StoreService;
import com.rhymes.app.member.model.SellerDTO;
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
   RegisterService register;
   @Autowired
   PurchaseService purchase;
   
   @Autowired 
   UsedService usedService;
   
   DecimalFormat formatter = new DecimalFormat("###,###");
   
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
      
   @GetMapping("/productList")
   public String productList(Model model, ProductParam param) throws Exception{
	  
      System.out.println("상품리스트 페이지 넘버 : " + param.getPageNumber());
      System.out.println("-----------c2name: " + param.getC2_name());
      System.out.println("-----------c3name: " + param.getC3_name());
      
      if( param.getSorting()==null||("").equals(param.getSorting()) ) {
    	param.setSorting("NEW");  
      }
      
      // 입점 업체 리스트
      List<String> clist = store.getCompnayList();   
      // 1차 카테고리 리스트 초기화
      List<Category1Dto> cate1list = new ArrayList<Category1Dto>();
      // 2차 카테고리 리스트 초기화
      List<Category2Dto> cate2list = new ArrayList<Category2Dto>();
      
      if(param.getC1_name()!=null && !param.getC1_name().equals("")) {
         // 카테고리 선택하고 검색시 카테고리 리스트 설정
         if(param.getKeyword()!=null && param.getKeyword()!= "") {
            System.out.println("^^^^^^^" + param.getC1_name());
            if(param.getC1_name().equals("MEN")) {
               param.setC1_seq(1);
            }else if(param.getC1_name().equals("WOMEN")) {
               param.setC1_seq(2);
            }
            cate2list = store.getkCate2List(param);
         // 아무조건없이 카테고리1 클릭해서 들어갈 때   
         }else{
            if(param.getC1_name().equals("MEN")) {
               cate2list = register.getCate2List(1);
            }else if(param.getC1_name().equals("WOMEN")) {
               cate2list = register.getCate2List(2);
            }
         }
      // 브랜드 클릭 + 카테고리1 선택없이 전체검색시 카테고리 리스트 설정
      }else if(param.getC1_name()==null || param.getC1_name().equals("")){
         cate1list = store.getkCate1List(param);
         model.addAttribute("cate1list", cate1list);         
      }
      log.info(param.getKeyword());
      
      // paging 처리
      int sn = param.getPageNumber(); 
      int start = sn * param.getRecordCountPerPage() + 1; 
      int end = (sn + 1) * param.getRecordCountPerPage();
      
      param.setStart(start);
      param.setEnd(end);
            
      //상품 총갯수
      int totalProduct = store.getProductCnt(param);
      
      /* 상품 리스트 */
      List<ProductDto> plist = store.getProductList(param);
      
      System.out.println("상품리스트 사이즈 : " + plist.size());
      
      for (int i = 0; i < plist.size(); i++) {
         int price = plist.get(i).getP_price();
         plist.get(i).setP_price2(formatter.format(price));
      }
      
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
   
   @ResponseBody
   @GetMapping("/kCate2List")
   public List<Category2Dto> getkCate2List(ProductParam param) throws Exception{
      List<Category2Dto> cate2list = store.getkCate2List(param);
      System.out.println("ggggggggggggggggggggggggg");
      return cate2list;
   }
      
   @ResponseBody
   @GetMapping("/kCate3List")
   public List<Category3Dto> getkCate3List(ProductParam param) throws Exception{
      List<Category3Dto> cate3list = store.getkCate3List(param);
      return cate3list;
   }
   
   @ResponseBody
   @GetMapping("/cate2List")
   public List<Category2Dto> getCate2List(int c1_seq) throws Exception{
      List<Category2Dto> cate2list = register.getCate2List(c1_seq);
      return cate2list;
   }
   
   @ResponseBody
   @GetMapping("/cate3List")
   public List<Category3Dto> getCate3List(int c2_seq) throws Exception{
      List<Category3Dto> cate3list = register.getCate3List(c2_seq);
      return cate3list;
   }
   
   @ResponseBody
   @GetMapping("/sizeUnit")
   public List<String> sizeUnit(String c2_seq) throws Exception{
      
      int c2_seq2 = Integer.parseInt(c2_seq);
      
        String[] sizeUnits = register.getSizeunit(c2_seq2).split("/");
        List<String> list = Arrays.asList(sizeUnits);
        System.out.println("-----------" + list);
      
      return list;
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
   
   //@PostMapping("/store/productDetail")
   @RequestMapping(value="/productDetail", method = RequestMethod.GET)
   public String productDetail(Model model, ProductDto product, Principal prc, HttpServletRequest req) throws Exception{
      
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      List<StockDto> sizelist = purchase.getSizeList(product.getP_seq());
      
      ProductDto productDto = purchase.getProductDetail(product.getP_seq());
      productDto.setP_price2(formatter.format(productDto.getP_price()));
      
   //위시리스트 체크 여부
       WishlistDto wish = new WishlistDto();
       //세션에서 가져와야함
       wish.setId(userId);
       wish.setP_seq(product.getP_seq());
       boolean wishChk = purchase.chkWishlist(wish);
      
    //left nav
       model.addAttribute("c1_name", product.getC1_name());
       /* 브랜드 리스트 */
       List<String> clist = store.getCompnayList();    
       model.addAttribute("clist", clist);
       /* 2차 카테고리 리스트 */
       List<Category2Dto> cate2list = new ArrayList<Category2Dto>();
       
       if(product.getC1_name() != "" || product.getC1_name() != null) {
         if(product.getC1_name().equals("MEN")) {
            cate2list = register.getCate2List(1);
         }else if(product.getC1_name().equals("WOMEN")) {
            cate2list = register.getCate2List(2);
         }
       }
       
       model.addAttribute("userId", userId);
       model.addAttribute("cate2list", cate2list);
       model.addAttribute("wishChk", wishChk);
       model.addAttribute("sizelist", sizelist);
       model.addAttribute("productDto", productDto);
      
      return "productDetail.tiles";
   }
   
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
   
   
   @ResponseBody
   @GetMapping("/insertBasket")
   public List<BasketListDto> insertBasket(BasketDto basket, Principal prc)throws Exception{
      
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      basket.setId(userId);
      
      String str = "";
      boolean bool1 = purchase.chkBasket(basket);
      if(bool1) {
         //str="이미 장바구니에 등록된 상품입니다.";
         log.info("장바구니에 이미 들어있음ㅋ");
         
         int n = purchase.updateBaksetQ(basket);
         log.info("수정된 수량 : " + basket.getP_quantity() + "");
         log.info("수정대상 stock_seq : " + basket.getStock_seq() + "");
         if(n==1) {
            log.info("장바구니 수량 수정됨");
         }
      }else {
         try {
            boolean bool2 = purchase.insertBasket(basket);
            if(bool2) {
               //str = "장바구니에 담았습니다.";
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
   
   
   @GetMapping("/basket")
   public String basket(Model model, Principal prc)throws Exception {
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      BasketDto basket = new BasketDto();
      //Session ID SET
      basket.setId(userId);
            
      List<BasketListDto> blist= purchase.getBasketList(userId);
      
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      int quantity = 0; /*재고수량*/
      
      for (int i = 0; i < blist.size(); i++) {
         int price = blist.get(i).getP_price();
         blist.get(i).setP_price2(formatter.format(price));
      // 총액 결제 금액 계산
         unitPrice = blist.get(i).getP_price();
         basketPcnt = blist.get(i).getP_quantity();
         quantity = blist.get(i).getQuantity();
         if(quantity != 0) {
            //제품 단가 * 재고번호 수량
            total_price += (unitPrice * basketPcnt);
         }
         
      }
      blist.get(0).setTotal_price(formatter.format(total_price));
      blist.get(0).setTotal_price2(total_price);
      model.addAttribute("blist", blist);
      return "basket.tiles";
   }
   
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
   
   @ResponseBody
   @GetMapping("/deleteBasketAll")
   public String deleteBasket(Principal prc) throws Exception{      
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
            /* String str = "삭제가 " */
         }
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      return "";
   }
   
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
      //System.out.println("sss");
      
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
   
   
   //재입고 신청 INSERT
   @ResponseBody
   @GetMapping("/restockNotify_insert")
   public String restockNotify_insert(Principal prc,RestockNotifyDto restock) throws Exception {
      
	  String userId = "";
      if(prc != null) {
         userId = prc.getName();
         restock.setId(userId);
         
         try {
			boolean bool = purchase.insertRestockN(restock);
			
			if(bool) {
				System.out.println("재입고 알림 등록완료");
			}
        	 
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
         
      }
      
      String str = "";
      
      return null;
   }  
      
   
   
}
