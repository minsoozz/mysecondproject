<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


<div class="section_login">

	<h3 class="tit_login">아이디 찾기</h3>
	
	<div class="write_form find_view">
		<form id="form" name="fm" method="post" action="" onsubmit="return chkForm( this );">
			<input type="hidden" name="act" value="Y">
			<input type="hidden" name="rncheck" value="none">
			<input type="hidden" name="dupeinfo" value="">
			<strong class="tit_label">이름</strong>
			<input type="text" name="srch_name" tabindex="2" size="29" required="required" placeholder="고객님의 이름을 입력해주세요">
			
			<strong class="tit_label">이메일</strong>
			<input type="text" name="srch_mail" size="29" tabindex="5" required="required" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
			<button type="submit" class="btn_type1"><span class="txt_type">확인</span></button>
		</form>
	</div>
	
</div>


</body>
</html>