<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/regiChoice.css">
</head>
<body>
<div class="backcolor" align="center"></div>
<div align="center" class="regiintroducediv123">
	
	<div align="center" class="regiintroducediv">
		<span class="regiintroduce">안녕하세요.</span><br>
		<span class="regiintroduce">빠르고 간편한 쇼핑, RHYMES입니다.</span>	
	</div>
	
<%-- 	<img class="imgclass" alt="x" src="<%=request.getContextPath() %>/img/member-img/fashion2.jpg"><br> --%>
	<div class="btndiv">	
		<button type="button" class="regibutton" onclick="location.href='/member/regimember'">일반 회원가입</button>
		
		<div align="center" class="regiintroducediv2">
			<span class="selletext">사업자이신가요?</span>
		<!-- 				<span>사업자등록증을 보유한 판매회원</span> -->
			<button type="button" class="regibutton" onclick="location.href='/member/regiseller'">사업자 회원가입</button>
		</div>
	</div>	
</div>
</body>
</html>