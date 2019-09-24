<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage Template</title>
<link rel="stylesheet" href="<%=ctx%>/css/member/layout/mypage_template.css">
</head>
<body>
	<tiles:insertAttribute name="header"/> <!--  /WEB-INF/views/common/layout/header.jsp -->
	
	<section class="mypage_top_template">
		<tiles:insertAttribute name="mypage_top"/> <!-- 마이페이지 상단 메뉴 -->
	</section>
	<div class="mypage_middle_template" align="center">
		<section class="mypage_middle_left_template">
			<tiles:insertAttribute name="mypage_left"/> <!-- 마이페이지 좌측 메뉴 -->
		</section>
		<section class="mypage_middle_content_template">
			<tiles:insertAttribute name="mypage_content"/> <!-- 마이페이지 본문 -->
		</section>
	</div>
	
	<tiles:insertAttribute name="footer"/> <!-- /WEB-INF/views/common/layout/footer.jsp -->
</body>
</html>