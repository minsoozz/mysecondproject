<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/inputText.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/findid.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- 
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
 -->

<script type="text/javascript">

function chkForm() {
	var userinput = eval("document.userinput");
	if(!userinput.userid.value) {
		alert("아이디를 입력하세요");
		$("#_id").focus();
		return false;
	}
}
	
</script>

<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
 </script>
 
 
<script type="text/javascript">
function checkIt() {
	// abcde12ef34형태로 만들기
	
	// abcde
	var number1 = Math.floor(Math.random() * 10000) + 10000;
    if(number1>10000){
       number1 = number1 - 1000;
    }
    
    //12
    var number2 = Math.floor(Math.random() * 10) + 10;
    if(number2>100){
       number2 = number2 - 10;
    }
    
    //ef
    var number3 = Math.floor(Math.random() * 10) + 10;
    if(number3>100){
       number3 = number3 - 10;
    }
    //34
    var number4 = Math.floor(Math.random() * 10) + 10;
    if(number4>100){
       number4 = number4 - 10;
    }

    $("#pwcode1").val(number1);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
    $("#pwcode2").val(number2);
    $("#pwcode3").val(number3);
    $("#pwcode4").val(number4);
}
 </script>
 
</head>
<body>

<div id="tabs">
  <ul>
    <li><a href="#tabs-2">아이디 찾기</a></li>
    <li><a href="#tabs-1">비밀번호 찾기</a></li>
  </ul>
  
  
  
  <!-- 아이디찾기 -->
  <div id="tabs-2">
    <div class="section_login">
		<div class="section_login_email" >
			<form action="/member/getFindID" name="userinput" method="get" onsubmit="return checkIt()">
	
				<input type="text" class="inputtext_b_long" name="useremail" size="29" tabindex="5" required="required" placeholder="이메일"><br>
	
				<input type="password" class="inputtext_b_long" name="userpw" size="29" required="required" placeholder="비밀번호"><br>
	
				<button type="submit" class="regibutton_long"><span style="color: #545454;">확인</span></button><br>
				<button type="button" class="regibutton_long" onclick="javascript:window.location.href='login'"><span style="color: #545454;">돌아가기</span></button>
				
			</form>
		</div>
	</div>
  </div>
  
  
  <!-- 비밀번호 찾기 -->
  <div id="tabs-1">
    <div class="section_login">
		<div class="section_login_email" >
			<form action="/member/getFindPWtel" name="userinput" method="get" onsubmit="return checkIt()">
				<input type="hidden" name="pwcode1" id="pwcode1">
				<input type="hidden" name="pwcode2" id="pwcode2">
				<input type="hidden" name="pwcode3" id="pwcode3">
				<input type="hidden" name="pwcode4" id="pwcode4">
				
<!-- 				<strong class="txt_title"><input type="radio">휴대폰으로 찾기</strong><br><br> -->
				
				<input type="text" class="inputtext_b_long" id="_userid" size="29" tabindex="5" required="required" placeholder="아이디">
				<input type="button" value="확인" class="regibutton_b" id="_idbtn">
				<input type="hidden" id="IdText" name="userid" value="아이디인증확인용">
				<br>
	
				<select class="selectbox" id="telSelect">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="070">070</option>
				</select>
				<input type="text" class="inputtext_b_long" id="to" size="29" required="required" placeholder="- 없이 입력" maxlength="8"><br>
				<input type="button" value="인증번호 전송" id="send" class="regibutton_b">
				
				<br>
				<input type="text" value="" placeholder="인증번호" class="findNum">
				<input type="hidden" id="frontto" name="phone" placeholder="010합치기">
				<input type="hidden" id="text" placeholder="확인용">
				<br>
				<button type="submit" class="regibutton_b_long"><span style="color:#545454;">확인</span></button><br>
				<button type="button" class="regibutton_b_long" onclick="javascript:window.location.href='login'"><span style="color: #545454;">돌아가기</span></button>
			</form>
		</div>
	</div>
  </div>

</div>






</body>

<script type="text/javascript">
$("#_idbtn").click(function(){
	
	$.ajax({
		url:"/member/getIDCheck",
		type:"get",
		data:{id:$("#_userid").val()},
		success:function(msg){
 			alert("suc");
			if(msg == 'YES'){
	 			alert("확인");	// id있음	
	 		$("#to").focus();
	 			$("#IdText").val($("#_userid").val());
	 		
			}else{
	 		alert("없는 아이디입니다.");			// 없음
	 		$("#_userid").val("");
	 //		$("#_userid").val($("#_id").val());
	 		$("#_userid").focus();
 	// 		idcheck = true;
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);


		}
	});
	
});


</script>

<!-- 전화번호 인증 -->
<script>
var count = 0; /* 문자 중복을 막기 위한 인증번호 */

$(document).ready(function() {

   $("#send").click(function() {
      
	  /*  if($("#IdText").text() == "" || $("#IdText").text()==null){
		   alert("아이디 확인을 해주세요");
		   $("#_userid").focus();
	   }else{ */
		   
	       var number = Math.floor(Math.random() * 100000) + 100000;
	       if(number>100000){
	          number = number - 10000;
	       }
	
	       $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
	      
	       var to = $("#to").val();
	       var frontnum = $("#telSelect").val();
	       alert("frontnum:" + frontnum);
	       $("#frontto").val(frontnum+to);
	       alert($("#frontto").text(frontnum+to));
	       if(to == "" || to == null){
	           alert("번호를 입력해 주세요");
	           $("#to").focus();
	       }
	       else {

			   var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
			 
	           if(con_test == true){
	        	   
	               if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
	            	   dd
	 
		              $.ajax({
		                  url:"sendSms.do",
		                  type:"get",
		                  data:{to: $("#frontto").val(),
		                       text: $("#text").val()
		                       },
		                success:function(){
		                  alert("해당 휴대폰으로 인증번호를 발송했습니다");
		                  count++;
		                  
		                  alert(count);
		                  },
		                  error(){}
		               });
		            } else {
		               alert("휴대폰 인증 그만하세요")
		            }
	         
	         	}
	            	else if(con_test == false){
	               
	            	}
	       }
// 	   }
	})
   

   $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
      alert($("#text").val());
      var userNum = $("#userNum").val();
      
      var sysNum = $("#text").val();         
      
      if(userNum == null || userNum == ""){
         alert("휴대폰으로 발송된 인증번호를 입력해주세요");
      }
      else{
          
          if(userNum.trim() == sysNum.trim()){
             alert("성공");
             $("#textresult").val(sysNum);
          }
          else {
             alert("실패");
          }          
      }

   });
});

</script>

</html>