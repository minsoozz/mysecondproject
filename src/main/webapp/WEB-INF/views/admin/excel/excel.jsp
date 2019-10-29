<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- java script -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/excel/excel.js"></script>
</head>
<body>

&nbsp;&nbsp;<input type="button" value="회원 정보 다운로드 " id="member_down">
&nbsp;&nbsp;<input type="button" value="결제 내역 다운로드 " id="payment_down">
&nbsp;&nbsp;<input type="button" value="상품정보 다운로드 " id="product_down">

<!-- 업체별 -->
&nbsp;&nbsp;<input type="button" value="우리 업체의 상품정보 다운로드 " id="com_product_down">
&nbsp;&nbsp;<input type="button" value="우리 업체의 결제정보 다운로드 " id="com_payment_down">

</body>
</html>