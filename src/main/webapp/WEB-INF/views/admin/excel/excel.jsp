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

<input type="button" value="회원 정보 다운로드 " id="member_down">
<input type="button" value="결제 내역 다운로드 " id="payment_down">
<input type="button" value="상품정보 다운로드 " id="product_down">

</body>
</html>