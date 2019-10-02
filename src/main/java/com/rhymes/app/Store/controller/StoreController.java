package com.rhymes.app.Store.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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

import com.rhymes.app.Store.model.BasketDto;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.SizeunitDto;
import com.rhymes.app.Store.model.StockDto;
import com.rhymes.app.Store.model.category.Category2Dto;
import com.rhymes.app.Store.model.category.Category3Dto;
import com.rhymes.app.Store.service.PurchaseService;
import com.rhymes.app.Store.service.RegisterService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Log4j

@RequestMapping("/Rhymes/*")
public class StoreController {
	
	@Autowired
	RegisterService register;
	@Autowired
	PurchaseService purchase;
	
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	
	
	@GetMapping(value = "/store/register")
	public String register() {
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
      
      return "productList.tiles";
   }
	
	@GetMapping(value="/store/productList")
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
	public String productDetail(Model model, int p_seq) throws Exception{
		List<StockDto> sizelist = purchase.getSizeList(p_seq);
		
		ProductDto productDto = purchase.getProductDetail(p_seq);
		productDto.setP_price2(formatter.format(productDto.getP_price()));
		
		model.addAttribute("sizelist", sizelist);
		model.addAttribute("productDto", productDto);
		return "productDetail.tiles";
	}
	
	@GetMapping("/store/productOrder")
	public String productOrder(Model model, int stock_seq, int p_quantity) {
		
		System.out.println("!!!!!!!!!!!!!@@");
		System.out.println("stock_seq : " + stock_seq);
		System.out.println("p_quantity : " + p_quantity);
		
		return "productList.tiles";
	}
	
	@ResponseBody
	@GetMapping("/store/insertBasket")
	public String insertBasket(BasketDto basket)throws Exception{
		System.out.println("!!!!!!!!!!!!!!!!!!!!!");
		basket.setId("sujin123");
		
		String str = "";
		boolean bool = purchase.insertBasket(basket);
		if(bool) {
			//System.out.println("장바구니 등록 완료");
			str = "장바구니에 담았습니다.";
		}else {
			str = "ㅠㅠ";
		}
		
		return str;
	}
	
	
}

