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
</head>
<body>



<div class="paymentAf_wrap" style="text-align: center; /* background-color: yellow; */">
<div class="paymentAf_payment_title">
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
	<td>${dto.totalprice }원</td>
	<td>${dto.payment_code }</td>
	<td>
	<c:if test="${dto.payment_status eq ready }">
		<td>미결제</td>
	</c:if>
	<c:if test="${dto.payment_status eq paid }">
		<td>결제완료</td>
	</c:if>
	<c:if test="${dto.payment_status eq cancelled }">
		<td>결제취소</td>
	</c:if>
	</td>
	<td>
	<c:if test="${dto.payment_method eq vbank }">
	무통장입금
	</c:if>
	<c:if test="${dto.payment_method eq card }">
		<td>신용카드</td>
	</c:if>
	<c:if test="${dto.payment_method eq trans }">
		<td>실시간계좌이체</td>
	</c:if>
	<c:if test="${dto.payment_method eq vbank }">
		<td>무통장입금</td>
	</c:if>
	<c:if test="${dto.payment_method eq phone }">
		<td>휴대폰소액결제</td>
	</c:if>
	<c:if test="${dto.payment_method eq point }">
		<td>카카오페이</td>
	</c:if>
	</td>

</tr>
</table>
</div>
<br><br>

<div class="paymentAf_delivery_title">
배송지 정보
</div>
<div class="paymentAf_delivery_content">
<table class="paymentAf_tb" border="1" style="width: 100%;">
<tr>
	<th>이름</th>
	<td>${dto.receive_name }</td>
	<th>연락처</th>
	<td>${dto.receive_phone }</td>
</tr>
<tr>
	<th>우편번호</th>
	<td>${dto.receive_postnum }</td>
	<th>주소</th>
	<td>${dto.receive_address }</td>
</tr>
<tr>
	<th>주문시 요청사항</th>
	<td colspan="3">${dto.receive_address_request }</td>
</tr>
</table>
</div>
<br><br>

<div class="paymentAf_result">
<b style="text-align: center;">
${dto.send_name }님의 주문이 완료되었습니다<br>
고객님의 주문번호는 ${dto.payment_code }입니다.<br>
제품 구입의 따른 적립금 ${dto.add_point }원은 배송완료 후 적립됩니다.<br>
주문해주신 제품 확인 후 보내드리겠습니다.<br>
구매해주셔서 감사합니다.<br>
<c:if test="${fn:length(vbank_num) eq 14 }">
무통장 입금&nbsp;:&nbsp;${dtoAf.vbank_name }&nbsp;&nbsp;${dtoAf.vbank_num }<br>
&nbsp;&nbsp;(예금주:${dtoAf.vbank_holder })&nbsp;&nbsp;${dto.send_name }<br>
${dtoAf.vbank_date }까지 ${dto.totalprice }원 입금해주세요${dto.receive_address_request }
</c:if>
</b>
</div>
<div class="paymentAf_btn">
<input type="button" onclick="location.href='/main'" value="메인으로">
<c:if test="${not empty dto.userid }">
<input type="button" onclick="location.href='/mypage/orderlog'" value="주문내역확인"><br>
</c:if>
<c:if test="${empty dto.userid }">
<input type="button" onclick="location.href='/ordercheck_nomembership_confirm_move'" value="주문내역확인"><br>
</c:if>
<a href="${dtoAf.receipt_url }">매출전표 확인하기</a>
</div>
</div>



<br><br>



</body>
</html>


