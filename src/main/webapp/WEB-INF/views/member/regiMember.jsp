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
<link href="style.css" rel="stylesheet" type="text/css" />

<style type="text/css">
* {padding:0; margin:0;}
html {font-family: Tahoma, Dotum, "����"; font-size: 0.75em;}
body {font-size: 1em; text-align:center;}
#wrap {width:500px; margin:0 auto; text-align:left;}
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
$(document).ready(function () {
	$(".Mix").hide();
});
function idOn() {
 	$(".Mix").show();
	//this.show();
}
</script>
<script type="text/javascript">
function checkIt() {
	var userinput = eval("document.userinput");
	if(!userinput.userid.value) {
		alert("아이디를 입력하세요");
		$("#_id").focus();
		return false;
	}
	if(!userinput.userpw.value) {
		alert("비밀번호를 입력하세요!");
		$("#_pwd").focus();
		return false;
	}
	if(userinput.userpw.value != userinput.userpw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#_pwd2").focus();
		return false;
	}
	
	// 이름검증
	if(!userinput.username.value){
		return true;
	}else{
	    var userName = userinput.name.value;
	    var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;
    	if (deny_char.test(userName)) {
    		alert("영문자 또는 한글 입력을 입력해주세요");
    		$("#_name").focus();
    		return false;
    	}
    	return true;
	}
	
	// 이메일 검증
	if(!userinput.useremail.value){
		return true;
	}else{
	    var userEmail = userinput.username.value;
    	var pattern = /^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/;
    	var bChecked = pattern.test(userEmail);
    	$("#_email").focus();
	    	return false;
    	}
    	return true;
	// 아이디 검증
	var saveId;
	$('[name=userid]').on('focus',function(){
	    saveId = $(this).val();
	    $(this).parent().find('.txt_guide').show();
	});
	// 아이디 - 숫자와 영문자 조합으로 6~12자
    var isTrue = $("input:text[idNumberEngOnly]").attr("idNumberEngOnly");
    var thisVal = $("input:text[idNumberEngOnly]").val();
 
    if(isTrue == "true") {
      if(!/^[a-zA-Z0-9]{6,12}$/.test(thisVal)) {
        alert("[아이디]는 숫자와 영문자 조합으로 6~12자까지 사용 가능합니다.");
 
        if(focusYN == "Y") {
          $("input:text[idNumberEngOnly]").focus();
        }
        return false;
        
      }
    }
    return true;
  
	// 비밀번호 검증
    var password = userinput.userpw.value;
	var id = userinput.userid.value;
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
        alert('숫자+영문자 조합으로 8~25자까지 사용가능합니다.');
        $('#_pwd').val('').focus();
        return false;
    }
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#_pwd').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(password)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#_pwd').val('').focus();
        return false;
    }
        
    if(password.search(id) > -1){
        alert("비밀번호에 아이디가 포함되었습니다.");
        $('#_pwd').val('').focus();
        return false;
    }
    return true;
    
}
</script>
<script type="text/javascript">
//아이디 검증
var saveId;
$('[name=userid]').on('focus',function(){
    saveId = $(this).val();
    $(this).parent().find('.txt_guide').show();
});
</script>
<script type="text/javascript">
// 아이디 - 숫자와 영문자 조합으로 6~16자
function idCheck(focusYN) {
    var isTrue = $("input:text[idNumberEngOnly]").attr("idNumberEngOnly");
    var thisVal = $("input:text[idNumberEngOnly]").val();
 
    if(isTrue == "true") {
      if(!/^[a-zA-Z0-9]{6,16}$/.test(thisVal)) {
        alert("[아이디]는 숫자와 영문자 조합으로 6~16자까지 사용 가능합니다.");
 
        if(focusYN == "Y") {
          $("input:text[idNumberEngOnly]").focus();
        }
 
        return false;
      }
    }
    
 //   boolean idcheck = false;
    
    alert("ok");
    alert($("#_id").val());
    $.ajax({
		url:"/member/getIDCheck",
		type:"get",
		data:{id:$("#_id").val()},
		success:function(msg){
 			alert("suc");
			if(msg == 'YES'){
	 			alert("msg == YES");	// id있음	
	 		$("#_rgetid").html("사용할 수 없는 아이디입니다.");
	 		$("#_rgetid").css("color", "red");
	 		$("#_id").val("");
	 //		$("#_userid").val("");
	 		$("#_id").focus();
	 		
			}else{
	 //		alert("msg == NO");			// 없음
	 		$("#_rgetid").text("사용 가능한 아이디입니다.");
	 		$("#_rgetid").css("color", "blue");
	 //		$("#_userid").val($("#_id").val());
	 		$("#_pwd").focus();
 	// 		idcheck = true;
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);


		}
	});
  	
    return true;
}
</script>
<script type="text/javascript">
/* $("#inputBtn").click(function(){
	
	alert("_idCheck");
	alert($("#_id").val());
	$.ajax({
		url:"getIDCheck",
		type:"post",
		data:{id:$("#_id").val()},
		success:function(msg){
// 			alert("suc");
			if(msg == 'YES'){
	 		//	alert("msg == YES");	// id있음	
	 		$("#_rgetid").html("사용할 수 없는 아이디입니다.");
	 		$("#_rgetid").css("color", "red");
	 		$("#_id").val("");
	 		$("#_userid").val("");
	 		$("#_id").focus();
	 		
			}else{
	 		//	alert("msg == NO");		// 없음
	 		$("#_rgetid").text("사용 가능한 아이디입니다.");
	 		$("#_rgetid").css("color", "blue");
	 //		$("#_userid").val($("#_id").val());
	 		$("#_pwd").focus();
	 		
			}
		},
		error:function(){
			alert("err");
		}
	});
	
}); */

/* $("#addmemBtn").click(function(){
	
	if(idcheck){
		location.herf="/member/addmem".submit();
	}else{
		alert("id중복확인을 해주세요");
		#("_#id").focus();
	}
	
}); */
</script>
</head>
<body>
<h1>regi1</h1>
<div id="wrap">
	<form action="/member/addmem" name="userinput" onsubmit="return checkIt()" method="get">
	<input type="hidden" name="authority" value="ROLE_MEMBER">
		<div id="body">
				<table width="500px;">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tr>
						<th colspan="2" class="subTitle">*아이디 입력</th>
					</tr>
					<tr>
						<th>아이디*</th>
						<td>
							<input type="text" id="_id" name="userid" maxlength="12" minlength="6" idnumberengonly="true" onclick="idOn()"/>
							<input type="button" name="confirm_id" value="ID 중복확인" 
							class="inputBtn" id="inputBtn" onclick="idCheck()" />
							<!-- 
							<p class="txt_guide" style="display: block;">
								<span class="txt txt_case1 bad">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
								<span class="txt txt_case2">아이디 중복확인</span>
							</p>
							 -->
							 <p class="Mix">6자 이상의 영문 혹은 영문과 숫자를 조합</p>
							<p id="_rgetid"></p>
						</td>
					</tr>
					<tr>
						<th>비밀번호*</th>
						<td>
							<input type="password" name="userpw" maxlength="25" minlength="8" class="passwd" id="_pwd" onclick="idOn()" />
							<p class="Mix">숫자+영문자 조합으로 8~25자까지 사용가능합니다.</p>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인*</th>
						<td>
							<input type="password" name="userpw2" maxlength="25" id="_pwd2"/>
						</td>
					</tr>
					<tr>
						<th colspan="2" class="subTitle">*개인정보 입력</th>
					</tr>
					<tr>
						<th>사용자 이름</th>
						<td>
							<input type="text" name="username" maxlength="10" id="_name" maxlength="10"/>
							<p class="Mix">영문자 또는 한글 입력</p>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="useremail" class="w300" id="_email" maxlength="30" /></td>
					</tr>
 					<tr>
						<th>휴대폰</th>
						<td>
							<input type="number" name="phone" maxlength="11" minlength="11"/>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div class="wrap-input100 bg1 rs1-wrap-input100">
							<input type="text" id="_postcode" name="postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="_address" name="address" placeholder="주소"><br>
							<input type="text" id="_detailAddress" name="detailAddress" placeholder="상세주소">
							<input type="text" id="_extraAddress" name="extraAddress" placeholder="참고항목">
							</div>
							
						</td>
					</tr>

					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" value="man">&nbsp;남자
							<input type="radio" name="gender" value="woman">&nbsp;여자
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="number" name="birth" placeholder="YYYYMMDD" maxlength="8" minlength="8">
						</td>
					</tr>					
				</table>
		</div>

		<div id="footer">
			<div id="avoidDbl">
				<input type="submit" name="confirm" class="inputBtn" value="등 록" />
			</div>
			<input type="reset" name="reset" class="inputBtn" value="다시입력" />
			<input type="button" value="취 소" class="inputBtn" onclick="javascript:window.location='login'" />
		</div>
	</form>

</div>
</body>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('_postcode').value = data.zonecode;
                document.getElementById("_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("_detailAddress").focus();
            }
        }).open();
    }
</script>


</html>