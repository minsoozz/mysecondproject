<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/login.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
					<input type="text" class="inputtext_long" name="username" id="txtId" placeholder="아이디를 입력해주세요" size="40" required>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="password" class="inputtext_long" name="password" id="txtPw" placeholder="비밀번호를 입력해주세요" onkeydown="onKeyDown()" required>
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
<!--  					<button type="button" class="btn btn-primary" id="btnLogin">zz테스트</button>  -->
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
	        <a href="https://kauth.kakao.com/oauth/authorize?client_id=7941c0b534b8b053634f144ea1b326ea&redirect_uri=http://localhost:18080/member/kakaoLogin&response_type=code">
	            <img src="/img/member-img/kakao_account_login_btn_medium_wide.png">
	        </a>
	    </c:if>
	    
	</div>
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin" align="center" style="position: relative; top: 10px;"></div>
	
	
<!-- </div> -->
</div>

</body>


<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "6tOlbeGI_v71dSverLKi",
			callbackUrl: "http://localhost:18080/member/callback",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 50, width: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
// 	console.log(naverLogin);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>



<script type="text/javascript">

function onKeyDown()
{
     if(event.keyCode == 13)
     {
          location.href="/login".submit();
     }
}

</script>


<script type="text/javascript">
$("#btnLogin").click(function() {
	alert("d");
// 	$("#_frmForm").attr({"action":"loginAf.do", "target":"_self"}).submit();		
});

var user_id = $.cookie("user_id");
if(user_id != null){	// 지정한 쿠키가 있을 때
	// alert("쿠키 있음");
	$("#txtId").val( user_id );
	$("#chk_save_id").attr("checked", "checked");
}
$("#chk_save_id").click(function() {
	
	if( $("#chk_save_id").is(":checked") ){	// 체크 되었을 때
	//	alert("체크 됨");
		if( $("#txtId").val().trim() == "" ){
			alert("id를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);			
		}else{	// 정상 기입한 경우
			// 쿠키 저장
			$.cookie("user_id", $("#txtId").val().trim(), {expires:7, path:'/'});
		}
	}
	else{
	//	alert("체크 없어짐");
		$.removeCookie("user_id", {path:'/'});
	}
});
$("#btnLogin").click(function(){
// 	location.href="regi.do";
});
</script>

</html>