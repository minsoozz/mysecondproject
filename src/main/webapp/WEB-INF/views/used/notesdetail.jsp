<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<%=ctx %>/js/used/notesdetail.js"></script>
</head>
<body>
	
	<c:if test="${userloginid eq dto.send_id }">	<!-- 보낸 쪽지 디테일 -->
	<div>
	<table>
	<col width="150"><col width="150">
	<tr>
	<th>받는사람</th><td id="sid">${dto.recv_id }</td>
	</tr>
	<tr>
	<th>보낸시간</th><td>${dto.data_send }</td>
	</tr>
	<tr>
	<td colspan="2"><textarea readonly="readonly" cols="65" rows="15">${dto.content }</textarea></td>
	</tr>
	<tr>
	<td><button type="button" id="sdelete">삭제</button>
		<button type="button" id="close">닫기</button>
	</td>
	</tr>
	</table>
	</div>
	</c:if>


	<c:if test="${userloginid ne dto.send_id }">	<!--받은 쪽지 디테일  -->
	<div>
	<table>
	<col width="150"><col width="150">
	<tr>
	<th>보낸사람</th><td>${dto.send_id }</td>
	</tr>
	<tr>
	<th>보낸날짜</th><td>${dto.data_send}</td>
	</tr>
	<tr>
	<td colspan="2"><textarea readonly="readonly" cols="65" rows="15">${dto.content }</textarea></td>
	</tr>
	<tr>
	<td colspan="2">
	<button type="button" id="ranswer">답장</button>
	<button type="button" id="rdelete">삭제</button>
	<button type="button" id="close">닫기</button>
	</td>
	</tr>
	</table>	
	</div>
	</c:if>
	<script type="text/javascript">
	
$("#sdelete").click(function() {
		
		var recv_id = "${dto.recv_id}";
		var send_id = "${userloginid}"
		
		location.href="notesdelete?recv_id="+recv_id+"&send_id="+send_id;
		window.opener.location.reload();
		window.close();
	});

$("#rdelete").click(function() {
	
	var recv_id = "${userloginid}";
	var send_id = "${dto.send_id}"
	
	location.href="notesdelete2?recv_id="+recv_id+"&send_id="+send_id;
	window.opener.location.reload();
	window.close();
});


	
$("#close").click(function() {
	window.close();
})
	</script>

</body>
</html>