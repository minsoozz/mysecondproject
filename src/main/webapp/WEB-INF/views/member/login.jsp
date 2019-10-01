<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/login.css">

</head>
<body>

<br>

<div class="login_wrap">
	<form action="/login" method="post">
		<!-- csrf 예방을 위한 코드추가 -->
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 		<div align="center">
		<table>
		<tr>
			<td align="center" colspan="2" class="logintext">로그인</td>
		</tr>
			<tr>
				<td colspan="2">	
					<input type="text" class="inputtext_long" name="username" id="txtId" placeholder="아이디를 입력해주세요" size="40">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="password" class="inputtext_long" name="password" id="txtPw" placeholder="비밀번호를 입력해주세요" onkeydown="onKeyDown()">
				</td>
			</tr>
			<tr>
				<td width="130px" style="padding: 0px;">
					<div class="rememberCheck">
				        <input class="rememberCheck-input" type="checkbox" id="chk_save_id">
				        <label class="rememberCheck-label" for="gridCheck1" style="font-size: small;">Remember Me</label>
				    </div>
			    </td>
			    <td style="padding: 0px;">
			    	<div class="findidpw">
				      <a class="" href="/member/getfindid" style="font-size: small; color: #212529">아이디 찾기</a>
				      l
				      <a class="" href="/member/getfindpw" style="font-size: small; color: #212529">비밀번호 찾기</a>
				    </div>
			    </td>
			</tr>
			<tr>
				<td colspan="2">
				<br>
					<input type="submit" value="로그인" class="regibutton_login">
<!-- 					<button type="button" class="btn btn-primary" id="btnLogin">로그인</button> -->
				</td>
			</tr>			
		</table>
		</div>	  
	</form>
	<div align="center">
	<table>
	
		<tr>
			<td colspan="2">
				<button type="button" class="regibutton_login" onclick="location.href='/member/regiMain'">회원가입</button>
			</td>
		</tr>
	</table>
	</div>

<!--     <div class="text-center"> -->
<br>
	<div align="center">
	    <c:if test="${userId eq null}">
	        <a href="https://kauth.kakao.com/oauth/authorize?client_id=7941c0b534b8b053634f144ea1b326ea&redirect_uri=http://localhost:18080/member/login&response_type=code">
	            <img src="/image/kakao_login_btn_medium.png">
	        </a>
	    </c:if>
	    <c:if test="${userId ne null}">
	        <h1>로그인 성공입니다</h1>
	    </c:if>
	</div>
<!-- </div> -->
</div>

</body>
<script type="text/javascript">

function onKeyDown()
{
     if(event.keyCode == 13)
     {
          location.href="/login".submit();
     }
}

</script>
</html>