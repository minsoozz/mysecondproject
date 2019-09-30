<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- arrow 생성 -->



<div id="button.wrap">
	<span class="button blue">
		<button type="button" id="_btnWrite">1:1문의</button>
	</span>
</div>
<form action="qnalist" name="frmForm1" id="_frmFormSearch" method="POST">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>        
 
<jsp:useBean id="uqna" class="com.rhymes.app.customer.util.QnaArrow" scope="page"/>    
<table class="list_table" style="width:85%" >
<colgroup>
	<col width="50"><col width="100"><col width="500"><col width="100"><col width="100">
</colgroup>
<thead>
<tr>
	<th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>작성일</th>
</tr>
</thead>

<tbody>
<c:if test="${empty qnalist }">
	<tr>
		<td colspan="5">질문하신 글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="qna" items="${qnalist }" varStatus="vs">
<tr class="_hover_tr">
	<td>${vs.count }</td>
	<td>${qna.category }</td>
	<td style="text-align: left;">
	
	<jsp:setProperty property="depth" name="uqna" value="${qna.depth }"/>
	<jsp:getProperty property="arrow" name="uqna"/> <!-- getArrow 호출 -->
		<a href="qnadetail?seq=${qna.seq}">
			${qna.title}
		</a>
	</td>
	<td>${qna.id }</td>
	<td>${qna.wdate }</td>
</tr>
</c:forEach>

<tr>
<th colspan="5">
<!-- 페이징 -->
<div id="paging_wrap"> 
	<jsp:include page="/WEB-INF/views/customer/paging.jsp" flush="false">
		<jsp:param name="pageNumber" value="${pageNumber }"/>
		<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
	</jsp:include>
</div>
<!-- 페이징끝 --> 
</th>
</tr>

</tbody>
</table>

</form>

<script type="text/javascript">

$("#_btnWrite").click(function () { 
	location.href = "qnawrite";
});

function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "qnalist").submit(); //
	
}


</script>