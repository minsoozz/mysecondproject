<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/inputText.css">
<style type="text/css">
* {padding:0; margin:0;}
html {font-family: Tahoma, Dotum, "����"; font-size: 0.75em;}
body {font-size: 1em; text-align:center;}
#wrap {width:1000px; margin:0 auto; text-align:left;}
#footer {text-align:center; padding:10px 0;}
#footer input {vertical-align:middle;}
fieldset {border:none;}
legend {display:none; visibility:hidden;}
table {table-layout: fixed; border-collapse: collapse; padding: 0; border-style: solid; border-width: 1px 1px 0 1px; border-color: #bbb;}
th {text-align:left; padding:3px;  border-collapse: 0; border-style: solid; border-width: 0 0 1px 0; border-color: #bbb; background:#ddd;}
td {text-align:left; border-collapse: 0; border-style: solid; border-width: 0 0 1px 0; border-color: #bbb; padding: 3px;}
input {font-family: Tahoma, Dotum, "����"; font-size:1em;}
td span {font-size:.9em; color:#cc0000;}
h1 {font-size:1.4em; text-align:center; padding:10px 0;}
.w300 {width:300px;}
.w380 {width:380px;}
.descB {padding:2px 0; display:block;}
th.subTitle {color:#339900; background:#fff !important; padding:8px 0 8px 5px;}
.inputBtn {border:1px solid #ccc; padding:3px 5px; line-height:1em; font-size:.9em;}
#footer .inputBtn {font-size:1.2em; font-weight:bold;}
</style>

<script type="text/javascript">
function checkIt() {
	var userinput = eval("document.userinput");
	
	if(!userinput.crname.value) {
		alert("사업자 등록번호를 인증 받으세요");
		$("#_c_num1").focus();
		return false;
	}
}
</script>



</head>
<body>
<h1>seller</h1>
<div id="wrap">

<!-- 	<form name="frm1">
		<input name="wrkr_no" type="text" value="2208183676"/>
		<input type="button" value="팝업" onclick="onopen();"/>
	</form> -->
	
	<form action="/member/addseller" name="userinput" onsubmit="return checkIt()" method="get">
<!-- 	<input type="hidden" name="authority" value="ROLE_MEMBER"> -->
		<div id="body">
		
			<div>
				사업자 등록번호
				<input type="text" name="crnum1" class="inputtext_s" id="_c_num1" minlength="3" maxlength="3" required="required">
				- <input type="text" name="crnum2" class="inputtext_s" id="_c_num2" minlength="2" maxlength="2" required="required">
				- <input type="text" name="crnum3" class="inputtext_s" id="_c_num3" minlength="5" maxlength="5" required="required">
				<input type="button" value="사업자 번호 인증" class="regibutton" id="_r_numBtn">

				<p id="_crText"></p>
			</div>
			
			<div>
				상호명
				<input type="inputtext" name="crname" id="_c_name" class="inputtext_s" readonly style="background-color: #f1f1f1">
			</div>
	
			<div id="footer">
				<input type="submit" name="confirm" class="regibutton" value="다 음" />
				<input type="reset" name="reset" class="regibutton" value="다시입력" />
				<input type="button" value="취 소" class="regibutton" onclick="javascript:window.location='login'" />
			</div>
			
		</div>
	</form>

</div>
</body>





<!-- 사업자번호인증 -->
<script type="text/javascript">
$(document).ready(function() {

   $("#_r_numBtn").click(function() {
	//  alert("사업자 번호 인증 클릭"); 
	//  alert($("#_c_num1").val());
		$.ajax({
		    url:"/member/getCRCheck",
		    type:"get",
		    data:{_c_num1: $("#_c_num1").val(),
		    	_c_num2: $("#_c_num2").val(),
		    	_c_num3: $("#_c_num3").val()
		         },
		  success:function(msg){
			  if(msg=="1"){
		//	    alert("RHYMES에 등록되어있는 사업자번호입니다.");
			    $("#_crText").text("이미 RHYMES에 등록되어있는 사업자번호입니다.");
			    $("#_crText").css("color", "red");
			  }
			  else if(msg=="NO"){
		//		alert("등록되지 않은 사업자번호입니다.");
			    $("#_crText").text("등록되지 않은 사업자번호입니다.");
			    $("#_crText").css("color", "red");
			  }
			  else{
			//	  alert("확인되었습니다. : " + msg);
				  $("#_crText").text("확인되었습니다.");
				  $("#_crText").css("color", "green");
				  
				  $("#_c_name").val(msg);	// 상호명
				  
				  $("#_c_num1").css("background-color","#f1f1f1");
				  $("#_c_num1").attr("readonly","readonly");
				  $("#_c_num2").css("background-color","#f1f1f1");
				  $("#_c_num2").attr("readonly","readonly");
				  $("#_c_num3").css("background-color","#f1f1f1");
				  $("#_c_num3").attr("readonly","readonly");
			  }

		    },
		    error(){}
		    
		 });
   })
   
});

</script>

<!-- 사업자등록번호 -->
<script language="JavaScript">
function onopen()
{
var url =
"http://www.ftc.go.kr/bizCommPop.do?wrkr_no="+frm1.wrkr_no.value;
window.open(url, "bizCommPop", "width=750, height=700;");
}
</script>

</html>