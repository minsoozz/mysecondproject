<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

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
<meta 
http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="/css/store/productList.css">

</head>
<body>

<c:if test="${empty plist }">
<div align="center" id="emptyProduct">
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT09uR_LfHPdzAfTxt9K3hvmH6atw3ZJRM6lMX9BaaDf9U1EMHfcQ"><br>
<font>등록된 상품이 없습니다.</font>
</div>
</c:if>

<div class='mainDiv'>
	<div class='subDiv'>
			<c:set value="${plist[0].c1_name }" var="c1name"/>
			<input type="hidden" class="hdnC1name" value="${c1name }">
		<c:forEach items="${plist }" var="pro" varStatus="vs">
		<div class='eachDiv' style="cursor:pointer;" onclick="detail(${pro.p_seq })"> 
			<div style="margin-top: 18px; margin-bottom: 13px;"><img alt="사진없음" src="/upload/store/${pro.photo1_file }" style="width:250px;height:250px;" style="margin:3%;"><br>
			</div>
			<font size="4px"><b>${pro.p_name }</b></font><br>
			<font size="3px">${pro.c_name }</font><br>
			<font size="3px">&#8361;${pro.p_price2 }</font><br>
			<font size="2px">(${pro.p_color })</font>
		</div>	
		</c:forEach>
	</div>
</div>

<!-- paging zone -->
<div id="paging_wrap" style="border: 0px solid red; width:90%%; height:50px; text-align: center;">
	<jsp:include page="/WEB-INF/views/store/productPaging.jsp" flush="false">
		<jsp:param name="pageNumber" value="${pageNumber }"/>
		<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
	</jsp:include>
</div>
               
<form action="/Rhymes/store/productDetail" id="moveFrm" method="get">
	<%-- <!-- ★ csrf 예방을 위한 코드추가 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	<input type="hidden" id="p_seq" name="p_seq" value="0">
	<input type="hidden" name="c1_name" value="${c1name }">
</form>

<form id="_frmFormSearch" action="" >
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:0 }">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<input type="hidden" name="c1_name" value="${c1name }">
</form>

<!------------------ SCRIPT ZONE ------------------>
<!-- 상품 상세정보 이동 -->
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

//사이즈 재고 ajax
$(document).ready(function () {
	function sizeBring(){
		alert("ㅎㅇ");
	}
});

// 상품 디테일 이동
function detail(seq, c1name){
	$("#p_seq").val(seq); 
	//var c1_name = $(".hdnC1name").val();
	//$("#moveFrm").attr("action", "/Rhymes/store/productList").submit();
	$("#moveFrm").submit();
}
// 페이징 이동
function goPage( pageNumber) {
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").submit();
}
</script> 
	
</body>
</html>