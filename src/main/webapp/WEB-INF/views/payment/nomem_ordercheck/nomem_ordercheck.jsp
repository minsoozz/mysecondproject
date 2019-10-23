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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/payment/nomem_ordercheck/nomem_ordercheck.js"></script>

</head>
<body>

<div class="ordercheck_detail_wrap">
<div class="ordercheck_detail_title">
<b>주문내역/배송조회</b>
</div>
<div class="ordercheck_detail_information">
황다래님께서 2019년 09월 18일에 주문하신 내역입니다.
</div>

<div>
<table class="ordercheck_tb">
<tr>
	<th>번호</th>
	<th>주문일자</th>
	<th>상품명</th>
	<th>결제금액</th>
	<th>주문상세</th>
	<th>배송현황</th>
	<th>상품후기</th>
</tr>
<c:forEach begin="0" end="${fn:length(order_list) - 1 }" step="1" varStatus="i">
<tr>
	<td>${i.index + 1 }</td>
	<td>${order_list[i.index].rdate }</td>
	<td></td>
	<td>${order_list[i.index].totalprice }</td>
	<td>
	<input type="button" value="주문상세보기" onclick="ordercheck_detail('${order_list[i.index].payment_code }')">
	</td>
 	<td>
	<input type="button" value="배송현황보기" onclick="ordercheck_delivery('${order_list[i.index].payment_code }')" >
	</td>
	<td>
	<input type="button" value="상품후기쓰기" onclick="ordercheck_review('${order_list[i.index].payment_code }')">
	</td>
</tr>
</c:forEach>
</table>
</div>

</div>



</body>
</html>