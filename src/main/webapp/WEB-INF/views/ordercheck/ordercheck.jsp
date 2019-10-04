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

<div class="ordercheck_wrap">
<table class="ordercheck_tb" border="1" style="width: 100%; background-color: red;">
<col width="5%"><col width="20%"><col width="20%"><col width="10%">
<col width="20%"><col width="10%"><col width="15%">
<tr>
	<th>번호</th>
	<th>주문일시</th>
	<th>주문번호</th>
	<th>결제방법</th>
	<th>상품금액</th>
	<th>주문상태</th>
	<th>상세보기</th>
</tr>
<c:if test="${empty ordercheck_list }">
<tr>
	<td>주문 내역이 없습니다</td>
</tr>
</c:if>
<c:if test="${not empty ordercheck_list }">
<c:forEach begin="0" end="${fn:length(ordercheck_list) -1 }" step="1" varStatus="i">
<tr>
	<td>${i.index + 1 }</td>
	<td>${ordercheck_list[i.index].rdate }</td>
	<td>
	<a href="#" id="ordercheck_a">${ordercheck_list[i.index].payment_code }</a>
	</td>
	<td>${ordercheck_list[i.index].payment_method }</td>
	<td>${ordercheck_list[i.index].totalprice }</td>
	<td>${ordercheck_list[i.index].payment_status }</td>
	<td><input type="button" value="상세보기" id="product_detail"></td>
</tr>
</c:forEach>
</c:if>
</table>
</div>



</body>
</html>