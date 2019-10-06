<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- ordercheck.js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/ordercheck/ordercheck.js"></script>

</head>
<body>



<div class="ordercheck_detail_wrap">
<div class="ordercheck_detail_title">
<b>주문내역/배송조회</b>
</div>
<div class="ordercheck_detail_information">
고객님께서 2019년 09월 18일에 주문하신 내역입니다.
</div>

<div class="ordercheck_detail_send_wrap">
<b class="ordercheck_detail_title">주문자정보</b>
<table class="ordercheck_detail_tb" border="1">
<tr>
	<th>주문자</th>
	<td>주문한 사람 이름</td>
	<th>주문일자</th>
	<td>주문한 날짜</td>
	<th>주문번호</th>
	<td>주문번호</td>
</tr>
</table>
</div>

<div class="ordercheck_detail_delivery_wrap">
<b class="ordercheck_detail_title">배송지정보</b>
<table class="ordercheck_detail_tb" border="1">
<tr>
	<th>수취인</th>
	<td>받는사람 이름</td>
	<th>연락처</th>
	<td>연락처</td>
	<th>배송번호</th>
	<td>배송번호</td>
</tr>
<tr>
	<th>주소</th>
	<td colspan="5"></td>
</tr>
<tr>
	<th>배송메세지</th>
	<td colspan="5"></td>
</tr>
</table>
</div>

<div class="ordercheck_detail_product_wrap">
<b class="ordercheck_detail_title">주문상품정보</b>
<table class="ordercheck_detail_tb" border="1">
<col width="5%"><col width="20%"><col width="20%"><col width="10%">
<col width="20%"><col width="10%"><col width="15%">
<tr>
	<th>번호</th>
	<th>상품이미지</th>
	<th>주문상품정보</th>
	<th>수량</th>
	<th>가격</th>
	<th>주문상태</th>
</tr>
<c:forEach begin="0" end="${fn:length(order_detail_list) -1 }" step="1" varStatus="i">
<tr>
	<td>${i.index + 1 }</td>
	<td>1</td>
	<td>2</td>
	<td>3</td>
	<td>4</td>
	<td>5</td>
</tr>
</c:forEach>
</table>
</div>

<div class="ordercheck_detail_payment_wrap">
<b class="ordercheck_detail_title">결제정보</b>
<table class="ordercheck_detail_tb" border="1">
<tr>
	<th>결제방법</th>
	<th>결제금액</th>
	<th>사용한 적립금</th>
	<th>사용한 쿠폰</th>
	<th>세부내역</th>
</tr>
<tr>
	<td>카드</td>
	<td>42,000</td>
	<td>1,500</td>
	<td>2,000</td>
	<td>
	<input type="button" id="ordercheck_detail_print" value="내역확인">
	</td>
</tr>
</table>
</div>

</div>



</body>
</html>