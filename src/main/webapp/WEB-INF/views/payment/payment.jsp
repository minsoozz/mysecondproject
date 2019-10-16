<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- payment.js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/payment/payment.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>





<div class="divfirst" align="left">
<div class="divback">
<h1>주문서</h1>
<h6 style="padding: 10px 10px 10px 10px;">주문하실 상품명 및 수량을 정확하게 확인해 주세요</h6>
</div>
<br><br><br><br><br><br>



<form id="payment_frm" name="payment_frm">

<div class="divback">
<h4>상품 정보</h4>
<table class="payment_tb">
<tr style="border-bottom: 1px solid #dbdbdb;">
	<td colspan="2" align="center" width="50%">상품 정보</td>
	<td width="20%" align="center">상품 금액</td>
</tr>

<c:forEach begin="0" end="${fn:length(basketList) -1 }" varStatus="i">
<tr>
	<td rowspan="2"><img alt="이미지없음" src="<%=request.getContextPath()%>/upload/store/${basketList[i.index].photo1_file }"></td>
	<td width="50%" align="left">[${basketList[i.index].p_name }]${basketList[i.index].c_name }</td>
	<td rowspan="2" width="10%" align="center" id="one_total_price${i.index }">
	<fmt:formatNumber value="${basketList[i.index].p_price * basketList[i.index].quantity }" />원
	<input type="hidden" name="stock_seq" value="${basketList[i.index].stock_seq }">
	<input type="hidden" name="quantity" value="${basketList[i.index].quantity }">
	<input type="hidden" name="stock_quantity" value="${fn:length(basketList) }">
	</td>
</tr>
<tr>
	<td align="left">${basketList[i.index].quantity }개/개 당 <fmt:formatNumber value="${basketList[i.index].p_price }"/>원</td>
</tr>
</c:forEach>

</table>
</div>
<br><br><br><br><br><br>





<div class="divback">
<h4>주문자 정보</h4>
<table class="payment_tb">
<!--
-->
<tr>
	<th>휴대폰 번호</th>
	<td>
	<input type="text" id="to" placeholder="전화번호 입력">   <!-- 인증번호 받을사람 휴대폰 번호 -->
	<input type="button" id="oneselfConfirmBtn" value="본인인증">
	&nbsp;비회원으로 구매를 원하시면, 본인인증이 필요합니다.<br>
	
	<input type="text" id="userNum" placeholder="인증번호 입력">   <!-- 인증번호 입력창 -->
	<input type="button" id="enterBtn" value="확인">

	<input type="text" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
	<input type="text" id="_text_confirm">

	</td>
</tr>
<tr>
	<th>보내는 분 *</th>
	<td><input type="text" size="26" id="send_name" name="send_name"></td>
</tr>
<tr>
	<th>휴대폰 *</th>
	<td><input type="text" size="5" id="send_phone1">&nbsp;-&nbsp;
	<input type="text" size="5" id="send_phone2">&nbsp;-&nbsp;
	<input type="text" size="5" id="send_phone3">
	<input type="hidden" name="send_phone" id="send_phone">
	</td>
</tr>
<tr>
	<th>이메일 *</th>
	<td><input type="text" id="send_email" name="send_email" size="26"><input type="hidden" onclick="location.href='/mailSender'" value="메일발송"></td>
</tr><tr>
	<td></td>
	<td>이메일을 통해 주문처리과정을 보내드립니다.<br>이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해 주세요.</td>
</tr>
</table>
</div>
<br><br><br><br><br><br>




<div class="divback">
<h4>배송 정보</h4>
<table class="payment_tb">
<tr>
	<th>주소 *</th>
	<td>위(주문자) 정보와 같음 <input type="checkbox" id="oldaddress"></td>
</tr>
<tr>
	<th></th>
	<td><input type="text" size="20" id="sample6_postcode" name="receive_postnum" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" size="67" id="sample6_address" placeholder="지번주소"><br>
	<input type="text" size="30" id="sample6_detailAddress" placeholder="상세주소">
	<input type="text" size="30" id="sample6_extraAddress" placeholder="참고항목">
	<input type="hidden" name="receive_address" id="receive_address">
	</td>
</tr>
<tr>
	<th>수령인 이름 *</th>
	<td><input type="text" size="26" id="receive_name" name="receive_name"></td>
</tr>
<tr>
	<th>휴대폰 *</th>
	<td><input type="text" size="5" id="receive_phone1">&nbsp;&nbsp;
	<input type="text" size="5" id="receive_phone2">&nbsp;&nbsp;
	<input type="text" size="5" id="receive_phone3">
	<input type="hidden" name="receive_phone" id="receive_phone">
	</td>
</tr>
<tr>
	<th>배송 요청사항</th>
	<td><textarea id="receive_address_request" name="receive_address_request" rows="3" cols="70"></textarea>0지/50자</td>
</tr>
</table>
</div>
<br><br><br><br><br><br>





<!-- 로그인 했을때만 보이기 -->
<div class="divback">
<h4>쿠폰 적립금</h4>
<table class="payment_tb" border="1">
<tr>
	<th>상품금액</th>
	<th></th>
	<th>배송비</th>
	<th></th>
	<th>할인금액</th>
	<th></th>
	<th>결제 예정금액</th>
</tr>
<tr>
	<td id="product_price">${totalprice }</td>
	<td>+</td>
	<td id="delivery_price">${delivery_price }</td>
	<td>-</td>
	<td id="discprice"><input type="text" id="_discprice" value="0"></td>
	<td>=</td>
	<td id="_totalprice"><input type="text" id="__totalprice"></td>
</tr>

<c:if test="${coupon_count eq 0 }">
<tr>
	<th rowspan="2">쿠폰 적용</th>
	<td></td>
</tr>
<tr>
	<td colspan="6">(보유쿠폰 : 0 개)</td>
</tr>
</c:if>
<c:if test="${coupon_count ne 0 }">
<tr>
	<th rowspan="2">쿠폰 적용</th>
	<td colspan="6">쿠폰 사용&nbsp;&nbsp;
	<input type="text" id="coupon_use" name="coupon_code" size="50" value="" onchange="count_disc_coup()">&nbsp;&nbsp;
	<input type="button" id="coupon_btn" value="쿠폰선택">
	
	<input type="text" id="coupon_use_func" size="5">
	<input type="text" id="coupon_use_func_num" size="5">
	<input type="text" id="coupon_use_func_measure" size="5">
	
	<input type="hidden" name="disc_coupon" id="disc_coupon" value="0">
	</td>
</tr>
<tr>
	<td colspan="6">(보유쿠폰 : ${coupon_count } 개) 중복할인 안됩니다
	<input type="hidden" id="point_amount" value="${point_amount }">
	</td>
</tr>
</c:if>
<tr>
	<th>적립금 적용</th>
<c:if test="${point_amount eq 0 }">
	<td colspan="6">사용 가능한 적립금이 없습니다</td>
</c:if>
<c:if test="${point_amount ne 0 }">
	<td colspan="6">
	<input type="text" id="disc_point" name="disc_point" onchange="price_change()" value="0">원
	&nbsp;&nbsp;사용가능 적립금 : <fmt:formatNumber value="${point_amount }" />원
	&nbsp;&nbsp;(1,000원 단위로 사용가능합니다)</td>
</c:if>
</tr>
</table>
</div>
<br><br><br><br><br><br>

<input type="hidden" name="payment_method" id="payment_method">
<input type="hidden" name="payment_status" id="payment_status">
<input type="hidden" name="delivery_price" value="${delivery_price }">
<input type="hidden" name="add_point" id="add_point" value="0">
<input type="hidden" name="totalprice" id="totalprice" value="0">
<input type="hidden" name="basket_del" value="${basket_del }">

<input type="hidden" name="payment_code" id="payment_code">
<input type="hidden" name="receipt_url" id="receipt_url">
<input type="hidden" name="vbank_num" id="vbank_num">
<input type="hidden" name="vbank_name" id="vbank_name">
<input type="hidden" name="vbank_date" id="vbank_date">
<input type="hidden" name="vbank_holder" id="vbank_holder">
<input type="hidden" name="card_apply_num" id="card_apply_num">




<div class="divback">
<h4>결제 수단</h4>
<table class="payment_tb">
<tr style="background-color: #fafafa">
	<th>결제 수단 선택</th>
	<td>
	신용카드 <input type="radio" name="payment" value="card">&nbsp;&nbsp;&nbsp;&nbsp;
	무통장입금 <input type="radio" name="payment" value="vbank">&nbsp;&nbsp;&nbsp;&nbsp;
	카카오페이 <input type="radio" name="payment" value="kakaopay">&nbsp;&nbsp;&nbsp;&nbsp;
	실시간 계좌이체 <input type="radio" name="payment" value="trans">&nbsp;&nbsp;&nbsp;&nbsp;
	휴대요금 결제 <input type="radio" name="payment" value="phone">
	</td>
</tr>
<tr>
	<td></td>
	<td></td>
</tr>
</table><br>
</div>
</form>


<input type="button" id="paymentBtn" value="결제하기" onclick="paymens()"><br><br>
</div>


<script type="text/javascript">
$(function(){
/* 	console.log("최초 실행");
	$("#coupon_use").change(function() {
		
		alert("쿠폰사용");
	});
	
	if($("#coupon_use").val() != ""){
		console.log(" 바뀜 ");
	} */
	
});


</script>



</body>
</html>