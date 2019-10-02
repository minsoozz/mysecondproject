<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<head>

<meta charset="UTF-8">
<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<% String ctx = request.getContextPath(); %>


<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="/css/store/productList.css">


</head>
<body>

<div class='mainDiv'>
	<div class='subDiv' align='center' ">
	<c:forEach items="${plist }" var="pro" varStatus="vs">
	<div class='eachDiv' style="cursor:pointer;" onclick="detail(${pro.p_seq })"> 
		<img alt="사진없음" src="/upload/${pro.photo1_file }" style="width:250px;height:250px;" style="margin:3%;"><br>
		<font size="5px"><b>${pro.p_name }</b></font><br>
		<font size="4px">&#8361;${pro.p_price2 }<br>
		<font size="3px">(${pro.p_color })</font>
	</div>	
	</c:forEach>
	</div>
</div>               
<form action="/Rhymes/store/productDetail" id="moveFrm" method="get">
	<%-- <!-- ★ csrf 예방을 위한 코드추가 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	<input type="hidden" id="p_seq" name="p_seq" value="0">
	<div align='center'>
		<!-- <input type="submit" value="상품 등록" > -->
	</div>
</form>


<!-- 상품 상세정보 이동 -->
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

function detail(seq){
	$("#p_seq").val(seq); 
	$("#moveFrm").submit();
	
}

/* 가격 comma */
 $(document).ready(function(){
	// var money = $(".commamoney").text();
	 //alert(money);
 });
 
	
</body>
</html>