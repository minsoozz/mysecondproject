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

import com.rhymes.app.Store.model.OrderDto;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.service.PaymentService;
import com.rhymes.app.payment.util.Coolsms;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService PaymentService;

	// 처음
	@RequestMapping("/daraewelcome")
	public String welcome() {
		System.out.println("daraewelcome");

		return "/payment/welcome";
	}

	// 단일제품 구매
	// @GetMapping("/payment")
	@RequestMapping(value = "/payment", method = { RequestMethod.POST, RequestMethod.GET })
	public String payment(Model model, String stock_seq, String p_quantity) throws Exception {
		System.out.println("daraepayment");

		System.out.println("상품재고 번호 : " + stock_seq);
		System.out.println("상품수량 : " + p_quantity);

		List<OrderDTO> basketList = new ArrayList<OrderDTO>();

		OrderDTO dto = new OrderDTO();
		dto.setStock_seq(Integer.parseInt(stock_seq));
		dto.setQuantity(Integer.parseInt(p_quantity));

		System.out.println("재고번호 : " + stock_seq + ", 수량 :" + p_quantity);

		// db 가져오기
		basketList.add(PaymentService.getOrder(dto));

		model.addAttribute("basketList", basketList);

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

		//String userid = pcp.getName();
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

			// DB 주문한 상품의 정보
			// 장바구니로 데이터를 가져갈 리스트에 넣는다
			basketList.add(PaymentService.getOrder(dto));

			// db로 받을 수 있는 건 재고수량이다
			// 주문수량은 매개변수로만 받을 수 있어서 직접 dto에 넣는다
			basketList.get(i).setQuantity(bOlist.get(i).getQuantity());
		}
		
		
		
		// DB 적립금 가져오기
		//int point_amount = PaymentService.getPoint(userid);
		
		// DB 쿠폰 가져오기
		//String coupon_code = PaymentService.getCoupon(userid);
		

		//model.addAttribute("point_amount", point_amount);
		//model.addAttribute("coupon_code", coupon_code);
		model.addAttribute("basketList", basketList);

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
	public String paymentAf(Model model) {
		System.out.println("daraepaymentAf");
		
		// 이메일로 결제내역을 보낸다
		
		// 적립금 차감한다
		
		// 사용한 쿠폰을 지운다
		
		// 주문한 상품수량만큼 재고수량에서 차감한다
		
		// db에 결제내역을 저장한다

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

}
