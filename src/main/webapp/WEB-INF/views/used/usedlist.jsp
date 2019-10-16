<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<link rel="stylesheet" href="/css/used/usedList.css">

</head>
<body>
<div>
	
<div>
	<button type="button" id="_all" name="all" class="sbtn">전체</button>
	<button type="button" id="_man" name="man" class="sbtn" value="남성의류">남성의류</button>
	<button type="button" id="_woman" name="woman" class="sbtn" value="여성의류">여성의류</button>
	<button type="button" id="_stuff" name="stuff" class="sbtn" value="패션잡화">패션잡화</button>
	<button type="button" id="_beauty" name="beauty" class="sbtn" value="뷰티/미용">뷰티/미용</button>
	<button type="button" id="_free" name="free" class="sbtn" value="무료나눔">무료나눔</button>
	</div>
	
	
<div align="right" style="margin-top: 20px">
	<form id="_frmFormSearch">
		<select id="s_select">
			<option value="title" <c:out value="${select == 't itle'? 'selected':'' }"/>>제목</option>
			<option value="content" <c:out value="${select == 'content'? 'selected':'' }"/>>내용</option>
			<option value="s_id" <c:out value="${select == 'id'? 'selected':'' }"/>>작성자</option>
		</select>
		<input type="text" name="keyword" id="_keyword" value="${keyword }">					
		<input type="button" value="검색" id="_formbtn" name="formbtn">
			
	<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage ? 0 : recordCountPerPage)}">	
	<input type="hidden" name="category" value="${category }">
</form>
	</div>
	<c:if test="${empty list }">
	
		작성된 글이 없습니다

	</c:if>	
	
<c:forEach items="${list }" var="var" varStatus="i">
<c:set var="img" value="${var.photo_sys }"/>
		<%
		String str = pageContext.getAttribute("img").toString();

	 	int idx = str.indexOf(",");
		
	 	String img = str.substring(0, idx);

%>			


		
		
		
	<div>
		<div id="product_main" style="cursor:pointer;" align="center" class="detail" val="${var.seq }">			
			<div style="margin-top: 18px; margin-bottom: 3px;"><img id="used_list_img" alt="" src="../upload/used/<%=img%>" style="margin:3%;"><br>
			</div>
				<font size="2px" color="gray" style="margin-bottom: 20px;">${var.category }</font><br>	
				<font size="4px"><b>${var.title }</b></font><br>
				<font size="3px">&#8361;${var.price }</font><br>
				<font size="2px">${var.place }</font>
		</div>
</div>
</c:forEach>
</div>


<!-- 페이징 -->
<div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/used/paging.jsp" flush="false"> 	
		<jsp:param name="pageNumber" value="${pageNumber }" />
		<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" /> 
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
	</jsp:include>

</div>



<script type="text/javascript">
function goPage( pageNumber ) { /* pageNumber는 현재 페이지를 뜻한다 */
	$("#_pageNumber").val(pageNumber);
	
	$("#_frmFormSearch").attr("action","usedlist").submit();
}


$(document).ready(function() {
	
	$("div.detail").click(function() {
		var seq= $(this).attr("val");
		
		location.href="/used/useddetail?seq="+seq;
	})
	
	$(".sbtn").click(function() {
		var category = $(this).val();
	
	    var keyword = $("#_keyword").val();
		var select = $("#s_select").val();
		
		location.href="usedlist?category="+category+"&keyword="+keyword+"&select="+select;
		
		
		
	});
	
	$("#_formbtn").click(function() {
		
		var category = "${category}";
		
	    var keyword = $("#_keyword").val();
		var select = $("#s_select").val();
		
	location.href="usedlist?category="+category+"&keyword="+keyword+"&select="+select; 
		
	});
})

</script>

</body>
</html>