<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
a{
	text-decoration: none;
}
</style>
</head>
<body>
Login page
<br>

<div class="login_wrap" style="width: 50%; margin:auto; margin-top: 200px;">
	<form action="/login" method="post">
		<!-- csrf 예방을 위한 코드추가 -->
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table>
			<tr>
				<td>
					아이디
					<input type="text" class="form-control" name="username" id="txtId" placeholder="ID" size="40">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호<input type="password" class="form-control" name="password" id="txtPw" placeholder="PW" onkeydown="onKeyDown()">
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-check">
				        <input class="form-check-input" type="checkbox" id="chk_save_id">
				        <label class="form-check-label" for="gridCheck1">
				          Remember Me
				        </label>
				    </div>
			    </td>
			</tr>
			<tr>
				<td align="right">
					<input type="submit" value="로그인(submit)">
					<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
				</td>
			</tr>			
		</table>	  
	</form>
	<table>
		<tr>
			<td>
				<button type="button" class="btn btn-light" onclick="location.href='/member/regiMain'">회원가입</button>
			</td>
		</tr>
	</table>
	<div class="text-center">
      <a class="d-block small mt-3" href="/member/findid">아이디 찾기</a>
      l
      <a class="d-block small" href="forgot-password.html">비밀번호 찾기</a>
    </div>
    <br>
    <div class="text-center">
    <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=7941c0b534b8b053634f144ea1b326ea&redirect_uri=http://localhost:18080/member/login&response_type=code">
            <img src="/image/kakao_login_btn_medium.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>
</div>
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