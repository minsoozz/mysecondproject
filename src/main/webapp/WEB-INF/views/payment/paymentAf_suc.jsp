<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
// 결제금액
String paid_amount = request.getParameter("paid_amount");
// 아임포트 거래 고유 번호
String imp_uid = request.getParameter("imp_uid");
// 결제상태
String status = request.getParameter("status");
// 결제수단
String pay_method = request.getParameter("pay_method");
// 거래 매출 전표
String receipt_url = request.getParameter("receipt_url");
// 주문명
String buyer_name = request.getParameter("buyer_name");
// 주소
String buyer_postcode = request.getParameter("buyer_postcode");
// 연락처
String buyer_tel = request.getParameter("buyer_tel");
// 수취인 주소
String buyer_addr = request.getParameter("buyer_addr");
// 배송시 요청사항
String buyer_addr_request = request.getParameter("buyer_addr_request");



String vbank_num = "";
String vbank_date = "";
String vbank_holder = "";
String vbank_name = "";

if(!request.getParameter("vbank_num").equals("undefined")){
	// 가상계좌
	vbank_num = request.getParameter("vbank_num");
	// 가상계좌 입금기한
	vbank_date = request.getParameter("vbank_date");
	// 가상계좌 예금주
	vbank_holder = request.getParameter("vbank_holder");
	// 가상계좌 은행명
	vbank_name = request.getParameter("vbank_name");
}
request.setAttribute("vbank_num", vbank_num);
request.setAttribute("receipt_url", receipt_url);



// 결제 상태를 알기 쉽게 바꾸기
if(status.equals("ready")){
	status = "미결제";
}else if(status.equals("paid")){
	status = "결제완료";
}else if(status.equals("cancelled")){
	status = "결제취소, 부분취소포함";
}else if(status.equals("failed")){
	status = "결제실패";
}

// 결제수단을 알기 쉽게 바꾸기
if(pay_method.equals("card")){
	pay_method = "신용카드";
}else if(pay_method.equals("trans")){
	pay_method = "실시간계좌이체";
}else if(pay_method.equals("vbank")){
	pay_method = "무통장입금";
}else if(pay_method.equals("phone")){
	pay_method = "휴대폰소액결제";
}else if(pay_method.equals("point")){
	pay_method = "카카오페이";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div class="paymentAf_wrap" style="text-align: center; margin-left: 40%; background-color: yellow;">
<div class="paymentAf_payment_title" style="background-color: red; width: 100%;">
결제방법
</div>
<div class="paymentAf_payment_content">
<table class="paymentAf_tb" border="1" style="width: 100%;">
<tr>
	<th>결제금액</th>
	<th>결제고유번호</th>
	<th>결제상태</th>
	<th>결제수단</th>
</tr>
<tr>
	<td><%=paid_amount %>원</td>
	<td><%=imp_uid %></td>
	<td><%=status %></td>
	<td><%=pay_method %></td>
</tr>
</table>
</div>
<br><br>

<div class="paymentAf_delivery_title" style="background-color: red; width: 100%;">
배송지 정보
</div>
<div class="paymentAf_delivery_content">
<table class="paymentAf_tb" border="1" style="width: 100%;">
<tr>
	<th>이름</th>
	<td><%=buyer_name %></td>
	<th>연락처</th>
	<td><%=buyer_tel %></td>
</tr>
<tr>
	<th>우편번호</th>
	<td><%=buyer_postcode %></td>
	<th>주소</th>
	<td><%=buyer_addr %></td>
</tr>
<tr>
	<th>주문시 요청사항</th>
	<td colspan="3"></td>
</tr>
</table>
</div>
<br><br>

<div class="paymentAf_result">
<b style="text-align: center;">
<%=buyer_name %>님의 주문이 완료되었습니다<br>
고객님의 주문번호는 <%=imp_uid %>입니다.<br>
제품 구입의 따른 적립금 2020원은 배송완료 후 적립됩니다.<br>
주문해주신 제품 확인 후 보내드리겠습니다.<br>
구매해주셔서 감사합니다.<br>
<c:if test="${fn:length(vbank_num) eq 14 }">
무통장 입금&nbsp;:&nbsp;<%=vbank_name %>&nbsp;&nbsp;<%=vbank_num %><br>
&nbsp;&nbsp;(예금주:<%=vbank_holder %>)&nbsp;&nbsp;<%=buyer_name %><br>
<%=vbank_date %>까지 <%=paid_amount %>원 입금해주세요<%=buyer_addr_request %>
</c:if>
<c:if test="${fn:length(vbank_num) ne 14 }">
<%=paid_amount %>원 <%=pay_method %> 결제로 <%=status %> 상태입니다
</c:if>
</b>
</div>
<div class="paymentAf_btn">
<input type="button" onclick="location.href='/main'" value="메인으로">
<input type="button" onclick="location.href='/mypage/orderlog'" value="주문내역확인"><br>
<a href="${receipt_url }">매출전표 확인하기</a>
</div>
</div>



<br><br>



</body>
</html>


