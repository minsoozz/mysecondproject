<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<script type="text/javascript" src="<%=ctx %>/js/member/mypage/content/myused.js"></script>
</head>
<body>

	<form id="_frmFormSearch">
		<select id="s_select">
			<option value="title" <c:out value="${select == 'title'? 'selected':'' }"/>>제목</option>
			<option value="content" <c:out value="${select == 'content'? 'selected':'' }"/>>내용</option>
		</select>
		<input type="text" name="keyword" id="_keyword" value="${keyword }">					
		<input type="button" value="검색" id="_formbtn" name="formbtn">
			
	<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage ? 0 : recordCountPerPage)}">	
</form>


<table border="1">
<col width="100"><col width="300"><col width="100"><col width="80"><col width="50">
<tr><td>상태</td>
<td>물품명</td>
<td>가격</td>
<td>찜/댓글</td>
<td>삭제</td>
</tr>
<c:if test="${empty plist  }">
<tr><td colspan="5">등록된 판매글이 없습니다</td></tr>
</c:if>

<c:forEach var="var" items="${plist }">
<tr>
<td>
<form id="selectfrm">
<input type="hidden" id="seq" name="seq" value="">
<select name="division" id="division" onchange="ChangeDivision(this)" seq="${var.seq }">
<option value="판매중" <c:out value="${var.division == '판매중'? 'selected':'' }"/>>판매중</option>
<option value="판매완료" <c:out value="${var.division == '판매완료'? 'selected':'' }"/>>판매완료</option>
</select>
</form>
</td>
<td><a href="#none" onclick="goUsedDetail(this)" val="${var.seq }">${var.title }</a></td>
<td>${var.price }</td>
<td>${var.likes }</td>
<td><button type="button" value="${var.seq }" class="deletebtn">삭제</button></td>
</tr>
</c:forEach>
</table>
<!-- 페이징 -->
<div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/member/mypage/content/sub/myusedpaging.jsp" flush="false"> 	
		<jsp:param name="pageNumber" value="${pageNumber }" />
		<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" /> 
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
	</jsp:include>

</div>


</body>
</html>