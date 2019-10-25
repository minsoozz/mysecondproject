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
	href="<%=request.getContextPath()%>/css/event/eventlist.css">
</head>
<body>


<div align="center">
	<table class="list_table">
	
	<c:if test="${empty eventlist }">
		<tr align="center">
			<td>리스트가 없습니다</td>
		</tr>
	</c:if>
	<c:forEach var="event" items="${eventlist }" varStatus="vs">
	<tr>
		<td>
			<img alt="x" src="/upload/event/${event.photo_banner }" onclick="godetail(${event.seq})" class="bannerimg">
		</td>
	</tr>
	<tr>
		<td align="right">${event.sdate }~ ${event.edate }<br><br></td>
	</tr>
	</c:forEach>
	
	
	</table>
	<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/event/paging.jsp"
			flush="false">
			<jsp:param name="pageNumber" value="${pageNumber }" />
			<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
			<jsp:param name="pageCountPerScreen"
				value="${pageCountPerScreen }" />
			<jsp:param name="recordCountPerPage"
				value="${recordCountPerPage }" />
		</jsp:include>
	</div>
	<!-- 페이징끝 -->
</div>

</body>


<script type="text/javascript">
$(".bannerimg").mouseover(function(){
	$(this).css("cursor", "pointer");
});

function godetail(seq){
 	location.href="eventdetail?seq="+seq;
}


</script>

</html>