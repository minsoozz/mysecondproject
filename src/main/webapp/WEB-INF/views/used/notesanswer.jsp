<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<form id="_notesform">
		<input type="hidden" value="${userloginid }" name="send_id">
		받는사람 :&nbsp;${dto.send_id }
		<hr>
    	<textarea id="content" name="content" cols="60" rows="14" maxlength="1000"></textarea>
		<div class="wrap">
    	<span id="counter">###</span>
		</div>
		<br>
		<input type="checkbox" id="_save" name="save">
		<b><a href="#none" onclick="save()">보낸쪽지함에 저장</a></b>(보낸쪽지함에 저장하면 수신확인/발송취소가 가능합니다.)
		<br>
		<button type="button" id="_send"><b>보내기</b></button><button type="button" id="_cancel">취소</button>
	</form>
	</div>
</body>
</html>