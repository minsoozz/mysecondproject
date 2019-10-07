<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div class="ordercheck_detail_wrap">

<div class="ordercheck_detail_send_wrap">
<b class="ordercheck_detail_title">주문자정보</b>
<table class="ordercheck_detail_tb">
<tr>
	<td>주문자</td>
	<td></td>
	<td>주문일자</td>
	<td></td>
	<td>주문번호</td>
	<td></td>
</tr>
</table>
</div>

<div class="ordercheck_detail_delivery_wrap">
<b class="ordercheck_detail_title">배송지정보</b>
<table class="ordercheck_detail_tb">
<tr>
	<td>수취인</td>
	<td></td>
	<td>연락처</td>
	<td></td>
	<td>배송번호</td>
	<td></td>
</tr>
<tr>
	<td>주소</td>
	<td colspan="5"></td>
</tr>
<tr>
	<td>배송메세지</td>
	<td colspan="5"></td>
</tr>
</table>
</div>

<div class="ordercheck_detail_product_wrap">
<b class="ordercheck_detail_title">주문상품정보</b>
<table class="ordercheck_detail_tb">
<col width="5%"><col width="20%"><col width="20%"><col width="10%">
<col width="20%"><col width="10%"><col width="15%">
<tr>
	<td>번호</td>
	<td>상품이미지</td>
	<td>주문상품정보</td>
	<td>수량</td>
	<td>가격</td>
	<td>주문상태</td>
</tr>
<c:forEach begin="0" end="${fn:length(ordercheck_list) -1 }" step="1" varStatus="i">
<tr>
	<td>${i.index + 1 }</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
</c:forEach>
<tr>
	<td colspan="6"></td>
</tr>
</table>
</div>

<div class="ordercheck_detail_payment_wrap">
<b class="ordercheck_detail_title">결제정보</b>
<table class="ordercheck_detail_tb">
<tr>
	<td>결제방법</td>
	<td></td>
	<td>결제금액</td>
	<td></td>
	<td>세부내역</td>
	<td>
	<input type="button" id="ordercheck_detail_print" value="내역확인">
	</td>
</tr>
<tr>
	<td>사용한 적립금</td>
	<td></td>
	<td>사용한 쿠폰</td>
	<td rowspan="3"></td>
</tr>
</table>
</div>

</div>



</body>
</html>