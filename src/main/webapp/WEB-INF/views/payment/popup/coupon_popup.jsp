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

<div class="">
<div class="">
<div class="coupon_get_title">
<ul>
	<li>보유 쿠폰 내역</li>
</ul>
</div>
<table>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
</table>
</div>
<div>
<div class="coupon_used_title">
사용 쿠폰 선택
</div>
<table>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td colspan="4">
	<input type="button" value="확인">
	<input type="button" value="취소">
	</td>
</tr>
</table>
</div>
</div>
<%-- 
<c:if test="${ }">
<c:forEach items="${ }" var="c">
<table>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
</table>

<table>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
</table>
</c:forEach>
</c:if>
--%>

</body>
</html>