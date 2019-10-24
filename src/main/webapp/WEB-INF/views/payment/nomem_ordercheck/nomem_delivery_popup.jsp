<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- ordercheck.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/payment/nomem_ordercheck/nomem_ordercheck.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- ordercheck.js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/payment/nomem_ordercheck/nomem_ordercheck.js"></script>

</head>
<body>

<div class="ordercheck_delivery_popup_title">
배송조회
</div>

<c:forEach var="delivery" items="${order_delivery_list }" varStatus="i">
<table class="ordercheck_delivery_popup_tb">
<tr>
	<td>배송번호</td>
	<td>수취인</td>
	<td>배송상태</td>
</tr>
<tr>
	<td>${delivery.delivery_post_code }</td>
	<td>${delivery.name }</td>
	<td>${delivery.delivery_status }</td>
</tr>
</table>
</c:forEach>



</body>
</html>