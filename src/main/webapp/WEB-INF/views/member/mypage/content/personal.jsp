<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<% String ctx = request.getContextPath(); %>
<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap/popper.min.js"></script>

<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="/css/member/mypage/content/personal.css">
</head>
<div class="mypage_main_content_title" align="left">
	<h3>개인 정보 수정</h3>
	<hr class="hr-rhy-title">
</div>

<sec:authentication property="principal" var="prc"/>
${prc.username }
<c:choose>
	<c:when test="${not empty prc.username }">
	</c:when>

</c:choose>
<!-- 비밀번호 재확인 전 (세션정보 조회) -->
<div class="form-group">
	<div class="form_head_info">
		<div class="form-row">
			<div class="col-md-12" align="center">
				<h3>비밀번호 재확인</h3>
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-12" align="center">
				회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 입력해주세요.
			</div>
		</div>
	</div>
	<form action="<%=ctx %>/mypage/reconfirmpw" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div class="form-row form_reconfirm box-rhy-gray">
		<div class="col-md-12" align="center">
			<div class="form-row">
				<div class="col-md-3" align="center">
					<p>아이디</p>
					<p name="userid">${prc.username }</p>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-3" align="center">
					<p>비밀번호</p>
					<input type="password" class="form-control" name="userpw">
				</div>
			</div>			
		</div>
	</div>
	<div class="form-row">
		<div class="col-md-12" align="center">
			<input type="submit" class="btn btn-rhy-full btn_reconfirm_submit" value="확인">
		</div>
	</div>
	</form>
</div>

<!-- 비밀번호 재확인 후 -->


</html>