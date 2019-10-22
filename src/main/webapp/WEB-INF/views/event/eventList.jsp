<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventList</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/event/event.css">
</head>
<body>


<div align="center">
	<table border="1" class="list_table">
	
	<c:if test="${empty eventlist }">
		<tr align="center">
			<td>리스트가 없습니다</td>
		</tr>
	</c:if>
	<c:forEach var="event" items="${eventlist }" varStatus="vs">
	<tr>
		<td>
			<img alt="x" src="/upload/event/${event.photo_file }"><br>
			${event.title }
		</td>
	</tr>
	</c:forEach>
	
	</table>
</div>











</body>
</html>