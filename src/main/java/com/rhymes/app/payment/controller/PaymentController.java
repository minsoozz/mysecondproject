package com.rhymes.app.payment.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentAfDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;
import com.rhymes.app.payment.service.PaymentService;
import com.rhymes.app.payment.util.Coolsms;
import com.rhymes.app.payment.util.PaymentEmail;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService PaymentService;

	// 단일제품 구매
	@RequestMapping(value = "/payment", method = { RequestMethod.POST, RequestMethod.GET })
	public String payment(Model model, String stock_seq, String p_quantity, Principal pcp) throws Exception {
		
		String userid = pcp.getName();

		List<OrderDTO> basketList = new ArrayList<OrderDTO>();

		OrderDTO dto = new OrderDTO();
		dto.setStock_seq(Integer.parseInt(stock_seq));

		// db 가져오기
		basketList.add(PaymentService.getOrder(dto));
		
		// db에는 재고수량이 있고 주문수량은 없다 매개변수로 받은 주문수량을 직접 넣는다
		basketList.get(0).setQuantity(Integer.parseInt(p_quantity));
		basketList.get(0).setId(pcp.getName());
		
		// 총금액 계산
		String totalprice = basketList.get(0).getP_price() * basketList.get(0).getQuantity() + "";

		int delivery_price = 0;
		if(Integer.parseInt(totalprice) < 10000) {
			delivery_price = 3000;
		}
		
		
		// DB 적립금 가져오기
		int point_amount = PaymentService.getPoint(userid);
		
		// DB 쿠폰 개수 가져오기
		int coupon_count = PaymentService.getCountCoupon(userid);
		
		// DB 쿠폰 가져오기
		List<MemberCouponDTO> coupon_code = PaymentService.getAllCoupon(userid);

		// 장바구니 내역 지울 수 있는 변수
		int basket_del = 0;
		

		model.addAttribute("basket_del", basket_del);
		model.addAttribute("coupon_code", coupon_code);
		model.addAttribute("point_amount", point_amount);
		model.addAttribute("coupon_count", coupon_count);
		model.addAttribute("basketList", basketList);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("delivery_price", delivery_price);

		if (true) {
			// 로그인 되어있으면 결제 페이지로 이동
			return "/payment/payment";
		} else {
			// 로그인 안되어있으면 로그인창으로 이동
			return "/payment/nomembership";
		}

	}

	// 장바구니 리스트 구매
	@RequestMapping("/payment/basketOrder")
	public String basketOrder(Model model, String blist_stockseq, String blist_pQuantity, Principal pcp) throws Exception {
		System.out.println("================= 여기부터 payment ==================");

		String userid = pcp.getName();
		// 장바구니에서 문자열로 데이터를 가져왔다
		// 예) 신발/청바지/티셔츠			// blist_stockseq : 주문한 상품의 재고번호
		// 예) 100/80/95				// blist_pQuantity : 주문한 상품의 재고수량
		

		
		// 재고번호와 수량을 구분자인 /를 기준으로 배열로 바꿔서 리스트에 넣기
		// 매개변수로 받은 데이터를 /를 구분자로 자르면 데이터의 개수가 나온다
		String[] _sqArr = blist_stockseq.split("/");
		int[] sqArr = Arrays.stream(_sqArr).mapToInt(Integer::parseInt).toArray();
		String[] _pqArr = blist_pQuantity.split("/");
		int[] pqArr = Arrays.stream(_pqArr).mapToInt(Integer::parseInt).toArray();

		List<OrderDTO> bOlist = new ArrayList<OrderDTO>();

		for (int i = 0; i < sqArr.length; i++) {
			OrderDTO order = new OrderDTO();

			order.setStock_seq(sqArr[i]);
			order.setQuantity(pqArr[i]);
			bOlist.add(order);
		}


		
		// 장바구니로 데이터를 가져갈 리스트 생성
		List<OrderDTO> basketList = new ArrayList<OrderDTO>();
		
		// bOlist 리스트의 사이즈만큼 즉, 데이터의 개수만큼 for문을 돌린다
		// 예) 신발/청바지/티셔츠			라면 데이터의 개수는 3이다
		for (int i=0; i<bOlist.size(); i++) {
			OrderDTO dto = new OrderDTO();
			// 데이터를 가져오기 위해서 주문한 상품의 재고번호를 dto에 담고 매개변수로 DB에 보낸다
			dto.setStock_seq(bOlist.get(i).getStock_seq());

			// DB 주문한 상품의 정보 가져오기
			// 장바구니로 데이터를 가져갈 리스트에 넣는다
			basketList.add(PaymentService.getOrder(dto));

			// db로 받을 수 있는 건 재고수량이다
			// 주문수량은 매개변수로만 받을 수 있어서 직접 dto에 넣는다
			basketList.get(i).setQuantity(bOlist.get(i).getQuantity());
			basketList.get(i).setId(userid);
		}
		
		for (OrderDTO dto : basketList) {
			System.out.println("장바구니 : " + dto.toString());
		}
		
		
		
		// DB 적립금 가져오기
		int point_amount = PaymentService.getPoint(userid);
		
		// DB 쿠폰 개수 가져오기
		int coupon_count = PaymentService.getCountCoupon(userid);
		
		// DB 쿠폰 가져오기
		List<MemberCouponDTO> coupon_code = PaymentService.getAllCoupon(userid);
		
		// 장바구니 내역 지울 수 있는 변수
		int basket_del = 1;

		int totalprice = 0;
		for (OrderDTO dto : basketList) {
			totalprice += dto.getP_price() * dto.getQuantity();
		}
		
		int delivery_price = 0;
		if(totalprice < 10000) {
			delivery_price = 3000;
		}

		model.addAttribute("basket_del", basket_del);
		model.addAttribute("coupon_code", coupon_code);
		model.addAttribute("point_amount", point_amount);
		model.addAttribute("coupon_count", coupon_count);
		model.addAttribute("basketList", basketList);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("delivery_price", delivery_price);

		if (true) {
			// 로그인 되어있으면 결제 페이지로 이동
			return "/payment/payment";
		} else {
			// 로그인 안되어있으면 로그인창으로 이동
			return "/payment/nomembership";
		}

	}

	// 주문페이지에서 결제 후 결제완료창으로 이동
	@RequestMapping("/paymentAf")
	public String paymentAf(Model model, PaymentDTO dto, PaymentAfDTO dtoAf, Principal pcp) {
		System.out.println("daraepaymentAf");
		dto.setUserid( pcp.getName() );
		System.out.println("dto : " + dto.toString());
		System.out.println("dtoAf : " + dtoAf.toString());
		
		// 상품 재고번호와 수량을 ,를 기준으로 가져온다
		String[] stock_seq = dtoAf.getStock_seq().split(",");
		String[] quantity = dtoAf.getQuantity().split(",");
		
		for (int i = 0; i < dtoAf.getStock_quantity(); i++) {
			System.out.println(stock_seq[i]);
			System.out.println(quantity[i]);

			// 주문한 상품수량만큼 재고수량에서 차감한다
			boolean b = PaymentService.disc_stock_quantity(stock_seq[i], quantity[i]);
			System.out.println("재고수량 차감 ----- " + (i+1) + "번째 상품 차감 : " + b);
			
			// 상품의 가격
			int price = PaymentService.getPrice(Integer.parseInt(stock_seq[i]));
			System.out.println("price : " + price);
			
			// db에 결제 디테일을 저장한다(후기 여부는 false)
			PaymentDetailsDTO dtoDt = new PaymentDetailsDTO(Integer.parseInt(stock_seq[i]), Integer.parseInt(quantity[i]), price, dto.getPayment_code());
			
			boolean b3 = PaymentService.payment_detail_save(dtoDt);
			System.out.println("결제 내역 디테일 저장 ---- " + b3);
		}
		
		// 적립금 차감한다 -- 아직
		boolean b = PaymentService.disc_point(dto);
		System.out.println("사용 포인트 차감 ----- " + b);

		// rhy_payment db에 결제내역을 저장한다
		boolean b2 = PaymentService.payment_save(dto);
		System.out.println("결제 내역 저장 ----- " + b2);
		
		// rhy_payment_after db에 결제내역을 저장한다
		boolean b3 = PaymentService.payment_after(dtoAf);
		System.out.println("결제 애프터 저장 ---- " + b3);

		// 사용한 쿠폰을 사용으로 변환
		boolean b4 = PaymentService.update_isused_coupon(dto);
		System.out.println("사용한 쿠폰을 사용으로 변환 ----- " + b4);

		// 배송내역 저장 -- 운송장번호 어떻게?
		boolean b5 = PaymentService.delivery_save(dto);
		System.out.println("배송 내역 저장 ----- " + b5);

		// 일반 결제말고 미니 장바구니와 장바구니 페이지에서 갈때만 내역 제거
		// rhy_store_basket 에서 구매한 id를 삭제
		if(dtoAf.getBasket_del() == 1) {
			boolean b6 = PaymentService.delete_basket(pcp.getName());
			System.out.println("장바구니 내역 지우기 ---- " + b6);
		}

		// 이메일로 결제내역을 보낸다 -- 폼 필요
		//PaymentMailling mail = new PaymentMailling();
		//mail.mailSender(dto);
		PaymentEmail mail = new PaymentEmail();
		try {
			mail.PaymentEmailSend(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 적립금 차감한다 -- 아직
		
		model.addAttribute("dto", dto);
		model.addAttribute("dtoAf", dtoAf);

		return "/payment/paymentAf";
	}

		
	// 주문페이지에서 비회원으로 주문할때 본인인증
	@ResponseBody
	@RequestMapping(value = "/sendsms", method = RequestMethod.GET)
	public String sendSms(HttpServletRequest request) throws Exception {
		System.out.println("본인인증");
		System.out.println("받는번호 : " + (String) request.getParameter("to"));
		System.out.println("인증번호 : " + (String) request.getParameter("text"));

		String api_key = "NCS4ZFTWNHGBIKUM";
		String api_secret = "TPH57XEIXFFDAUXJV3EBNDDS633YNFG2";

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();

		set.put("to", (String) request.getParameter("to")); // 받는 사람
		set.put("from", "01083256825"); // 발신번호
		set.put("text", "안녕하세요 인증번호는 [" + (String) request.getParameter("text") + "]입니다"); // 문자내용
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {
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

		return "success";
	}
	
	// 결제페이지에서 쿠폰 가져오기
	@RequestMapping(value = "/payment_coupon", method = RequestMethod.GET)
	public String payment_coupon(Model model, Principal pcp, String product_price, String delivery_price, String disc_point) {
		System.out.println("쿠폰 컨트롤러");
		String userid = pcp.getName();
		
		// DB 쿠폰 가져오기
		List<MemberCouponDTO> coupon_code = PaymentService.getAllCoupon(userid);

		model.addAttribute("coupon_code", coupon_code);
		if(disc_point == "") {
			model.addAttribute("disc_point", "0");
		}else {
			model.addAttribute("disc_point", disc_point);
		}

		if(delivery_price.equals("0")) {
			model.addAttribute("product_price", product_price);
		}else {
			model.addAttribute("product_price", Integer.parseInt(product_price) + 3000);
		}
		
		return "/payment/coupon";
	}

}
