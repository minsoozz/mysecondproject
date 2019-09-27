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
	<table>
		<tr>
			<td>
				<button type="button" class="regibutton" onclick="location.href='/member/regimember'">일반 회원가입</button>
			</td>
			<td>
				<button type="button" class="regibutton" onclick="location.href='/member/regiseller'">사업자 회원가입</button>
			</td>
		</tr>
	</table>
</body>
</html>