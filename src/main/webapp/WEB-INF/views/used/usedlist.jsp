<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<% String ctx = request.getContextPath(); %>
<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script> 
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script> 
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script> 

<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="/css/member/mypage/content/orderlog.css">
</head>
<body>
<div class="container">
<c:forEach items="${list }" var="var" varStatus="i">
<c:set var="img" value="${var.photo_sys }"/>
		<%
		String str = pageContext.getAttribute("img").toString();

	 	int idx = str.indexOf(",");
		
	 	String img = str.substring(0, idx);
		
	 	System.out.println(img);
		
%>			
<div>	
		<img alt="" src="../upload/<%=img%>">
</div>
</c:forEach>
</div>
</body>
</html>