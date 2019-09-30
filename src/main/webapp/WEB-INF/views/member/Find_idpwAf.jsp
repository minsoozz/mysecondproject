<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/inputText.css">
</head>



<body>

<form action="/member/getFindIDEmail" method="get">
	<div>
		<span>아이디 찾기</span>
	</div>
	<div>
		<span>고객님의 아이디 찾기가 완료되었습니다.</span>
	</div>
	<div>
		<span>아이디 : ${founduserid }</span>
	</div>
	<div>
		<span>뒷자리가 기억이 안난다면 버튼을 눌러주세요</span>
	</div>
	<div>
		<input type="submit" value="이메일로 아이디 보내기" name="confirm" class="regibutton">
	</div>
	<input type="hidden" id="_userid" value="${userid }" name="userid">
	<input type="hidden" id="_useremail" value="${useremail }" name="useremail">

</form>

</body>



</html>