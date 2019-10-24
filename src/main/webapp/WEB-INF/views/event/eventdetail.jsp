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
	href="<%=request.getContextPath()%>/css/event/eventdetail.css">
</head>
<body>


<div align="center">
	<table class="list_table">
	
	<tr>
		<th>${event.title }</th>
	</tr>
	<tr>
		<td>
			<img alt="x" src="/upload/event/${event.photo_content }">
		</td>
	</tr>
	
	</table>
</div>

</body>




</html>