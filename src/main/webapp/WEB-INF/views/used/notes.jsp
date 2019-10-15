<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String ctx = request.getContextPath(); %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<%=ctx %>/js/used/notes.js"></script>
</head>
<body>
<input type="hidden" id="_loginid" name="loginid" value="${userloginid }"> 
<button type="button" id="_send" name="send">쪽지 보내기</button>

<c:if test="${dto.subscribe eq 0 }">	<!-- 수신 설정 -->
	<a href='javascript: subscribe_func()'><img id="bellimg" alt="" src="/img/used-img/bell.png" style="width: 50px" height="50px" id="like_img"></a>
</c:if>

<c:if test="${dto.subscribe eq 1 }"> 	<!-- 수신거부 설정 -->
		<a href='javascript: subscribe_func()'><img id="bellimg" alt="" src="/img/used-img/bellAf.png" style="width: 50px" height="50px" id="like_img"></a>
</c:if>


<script type="text/javascript">
function subscribe_func(){
	
	var subscribe = "${dto.subscribe}";
	var id = "${dto.userid}";
	
	$.ajax({
		url:"/mypage/subscribe",
		type:"get",
		data : {
			subscribe : subscribe,
			id : id
		},
		success:function(num){
			if(num == 1){
				$("#bellimg").attr("src","/img/used-img/bell.png");
			} else if (num == 0){
				$("#bellimg").attr("src","/img/used-img/bellAf.png");
			}
		},
		error:function(e){
			alert(e);
		}
	})
}

</script>


</body>

</html>