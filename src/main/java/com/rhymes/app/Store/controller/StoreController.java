package com.rhymes.app.Store.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rhymes.app.Store.model.BasketDto;
import com.rhymes.app.Store.model.BasketListDto;
import com.rhymes.app.Store.model.OrderDto;
import com.rhymes.app.Store.model.PqnaDto;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.StockDto;
import com.rhymes.app.Store.model.category.Category2Dto;
import com.rhymes.app.Store.model.category.Category3Dto;
import com.rhymes.app.Store.service.PqnaService;
import com.rhymes.app.Store.service.PurchaseService;
import com.rhymes.app.Store.service.RegisterService;
import com.rhymes.app.customer.model.CustomerParam;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Log4j

@RequestMapping("/Rhymes")
public class StoreController {
	
	@Autowired
	RegisterService register;
	@Autowired
	PurchaseService purchase;
	
	//상품문의
	@Autowired
	private PqnaService PqnaService;
	
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	@GetMapping("/store/register")
	public String register()throws Exception{
		return "register.tiles";
	}  
	
	@ResponseBody
	@GetMapping("/store/cate2List")
	public List<Category2Dto> getCate2List(int c1_seq) throws Exception{
		List<Category2Dto> cate2list = register.getCate2List(c1_seq);
		return cate2list;
	}
	
	@ResponseBody
	@GetMapping("/store/cate3List")
	public List<Category3Dto> getCate3List(int c2_seq) throws Exception{
		List<Category3Dto> cate3list = register.getCate3List(c2_seq);
		return cate3list;
	}
	
	@ResponseBody
	@GetMapping("/store/sizeUnit")
	public List<String> sizeUnit(String c2_seq) throws Exception{
		
		int c2_seq2 = Integer.parseInt(c2_seq);
		
		  String[] sizeUnits = register.getSizeunit(c2_seq2).split("/");
		  List<String> list = Arrays.asList(sizeUnits);
		  System.out.println("-----------" + list);
		
		return list;
	}
	
	@RequestMapping(value="/store/registerInsert", method = RequestMethod.POST)
    public String registerInsert(Model model, ProductDto product, StockDto stock,
      MultipartHttpServletRequest multi, HttpServletRequest req) throws Exception{
      product.setC_name("test");
		
	  int p_seq = register.getPseq();
	  		
      String path = req.getServletContext().getRealPath("/upload");
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
      
      return "redirect:/Rhymes/store/productList";
   }
	
	@GetMapping("/store/productList")
	public String productList(Model model) throws Exception{

		List<ProductDto> plist = purchase.getProductList();

		for (int i = 0; i < plist.size(); i++) {
			int price = plist.get(i).getP_price();
			plist.get(i).setP_price2(formatter.format(price));
		}
		
		model.addAttribute("plist", plist);
		return "productList.tiles";
	}
	
	//@PostMapping("/store/productDetail")
	@RequestMapping(value="/store/productDetail", method = RequestMethod.GET)
	public String productDetail(Model model, int p_seq, CustomerParam param) throws Exception{
		List<StockDto> sizelist = purchase.getSizeList(p_seq);

		ProductDto productDto = purchase.getProductDetail(p_seq);
		productDto.setP_price2(formatter.format(productDto.getP_price()));
		
		String[] photo_list = new String[5];
		photo_list[0] = productDto.getPhoto1_file();
		photo_list[1] = productDto.getPhoto2_file();
		photo_list[2] = productDto.getPhoto3_file();
		photo_list[3] = productDto.getPhoto4_file();
		photo_list[4] = productDto.getPhoto5_file();
		
		List<String> photolist = new ArrayList<String>();
		photolist.add(productDto.getPhoto1_file());
		photolist.add(productDto.getPhoto2_file());
		photolist.add(productDto.getPhoto3_file());
		photolist.add(productDto.getPhoto4_file());
		photolist.add(productDto.getPhoto5_file());
		
		//배열
		model.addAttribute("photo_list", photo_list);
		//리스트
		model.addAttribute("photolist", photolist);
		model.addAttribute("sizelist", sizelist);
		model.addAttribute("productDto", productDto);
		
///////////////////상품문의부분////////////////
//페이징
int sn = param.getPageNumber();	//0 1 2
int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20

param.setStart(start);
param.setEnd(end);

List<PqnaDto> pqnalist = PqnaService.getPqnaList(param);

//글의 총수
int totalRecordCount = PqnaService.getPqnaCount(param);	
model.addAttribute("pqnalist", pqnalist);
model.addAttribute("pageNumber", sn);
model.addAttribute("pageCountPerScreen", 10);
model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
model.addAttribute("totalRecordCount", totalRecordCount);

		return "productDetail.tiles";
	}
	
	@GetMapping("/store/productOrder")
	public String productOrder(Model model, String stock_seq, String p_quantity, RedirectAttributes redirect) {
		/* int _stock_seq = order.getStock_seq(); */
		
		System.out.println(stock_seq + "," + p_quantity);
		int _stock_seq = Integer.parseInt(stock_seq);
		int _p_quantity = Integer.parseInt(p_quantity);
		
		OrderDto order = new OrderDto();
		order.setStock_seq(_stock_seq);
		order.setP_quantity(_p_quantity);
		order.setId("sujin123");
		
		List<OrderDto> oList = new ArrayList<OrderDto>();
		oList.add(order);
		
		/*
		 * System.out.println("stock_seq : " + stock_seq);
		 * System.out.println("p_quantity : " + p_quantity);
		 */
		
		//model.addAttribute(arg0, arg1);
		//model.addAttribute(arg0, arg1);
		//model.addAttribute("order", order);
		
		log.info("리스트 사이즈 : " + oList.size());
		
		 redirect.addAttribute("oList", oList);
		
		return "redirect:/Rhymes/payment";
	}
	
	@ResponseBody
	@GetMapping("/store/insertBasket")
	public List<BasketListDto> insertBasket(BasketDto basket)throws Exception{
		System.out.println("!!!!!!!!!!!!!!!!!!!!!");
		basket.setId("sujin123");
		
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
		List<BasketListDto> blist= purchase.getBasketList("sujin123");
		
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
	
	
	@GetMapping("/store/basket")
	public String basket(Model model)throws Exception {
		System.out.println("장바구니 이동 컨트롤ㄹㄹ러");
		BasketDto basket = new BasketDto();
		//Session ID SET
		basket.setId("sujin123");
				
		List<BasketListDto> blist= purchase.getBasketList("sujin123");
		
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
		blist.get(0).setTotal_price2(total_price);
		model.addAttribute("blist", blist);
		return "basket.tiles";
	}
	
	@ResponseBody
	@GetMapping("/store/deleteBasket")
	public int deleteBasket(int b_seq) throws Exception{		
		
		int unitPrice = 0;
		int basketPcnt = 0;
		int total_price = 0;
		String updatedTotal = "";	
		
		try {
			purchase.deleteBasket(b_seq);
			
			List<BasketListDto> blist= purchase.getBasketList("sujin123");
			for (int i = 0; i < blist.size(); i++) {
				int price = blist.get(i).getP_price();
				blist.get(i).setP_price2(formatter.format(price));
				unitPrice = blist.get(i).getP_price();
				basketPcnt = blist.get(i).getP_quantity();
				total_price += (unitPrice * basketPcnt);				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total_price;
	}
	
	@ResponseBody
	@GetMapping("/store/deleteBasketAll")
	public String deleteBasket() throws Exception{		
		
		BasketDto basket = new BasketDto();
		basket.setId("sujin123");
		
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
	@GetMapping("/store/updateBasketQ")
	public int updateBasketQ(BasketDto basket) throws Exception{
		
		int unitPrice = 0;
		int basketPcnt = 0;
		int total_price = 0;
		
		basket.setId("sujin123");
		
		try {
			int n = purchase.updateBaksetQ(basket);
	
			if(n==1) {
				List<BasketListDto> blist= purchase.getBasketList("sujin123");
				for (int i = 0; i < blist.size(); i++) {
					int price = blist.get(i).getP_price();
					blist.get(i).setP_price2(formatter.format(price));
					unitPrice = blist.get(i).getP_price();
					basketPcnt = blist.get(i).getP_quantity();
					total_price += (unitPrice * basketPcnt);				
				}
			}else {
				log.info("수량변경 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total_price;
	}
}

