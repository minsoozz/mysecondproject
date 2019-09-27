<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/inputText.css">
<style type="text/css">
.section_login{
	width: 400px;
	height: 500px;
/* 	background-color: orange; */
	float: left;

}
.section_login_email{
	width: 350px;
    height: 200px;
/* 	background-color: blue; */
	margin: 400px;
	
}
.section_login_pw{
	width: 350px;
	height: 200px;
/* 	background-color: olive; */
}
.tit_label{
	paddin:1px;
}
</style>


<script type="text/javascript">

function chkForm() {
	var userinput = eval("document.userinput");
	if(!userinput.userid.value) {
		alert("아이디를 입력하세요");
		$("#_id").focus();
		return false;
	}
	
</script>

</head>
<body>



<div class="section_login">

	<div class="section_login_email" >
		<form action="/member/getFindID" name="userinput" method="get" onsubmit="return checkIt()">

			<strong class="txt_title">이메일</strong>
			<input type="text" class="inputtext_b_long" name="useremail" size="29" tabindex="5" required="required" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요"><br>

			<strong class="txt_title">비밀번호</strong>
			<input type="password" class="inputtext_b_long" name="userpw" size="29" required="required" placeholder="고객님의 비밀번호를 입력해주세요"><br>

			<button type="submit" class="regibutton_long"><span style="color: #545454;">확인</span></button>
		</form>
	</div>

</div>


</body>




</html>