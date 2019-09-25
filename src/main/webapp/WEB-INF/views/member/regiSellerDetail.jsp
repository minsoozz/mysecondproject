<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
table {table-layout: fixed; border-collapse: collapse; padding: 0; border-style: solid; border-width: 1px 1px 0 1px; border-color: #bbb;}
th {text-align:left; padding:3px;  border-collapse: 0; border-style: solid; border-width: 0 0 1px 0; border-color: #bbb; background:#ddd;}
td {text-align:left; border-collapse: 0; border-style: solid; border-width: 0 0 1px 0; border-color: #bbb; padding: 3px;}
input {font-family: Tahoma, Dotum, "����"; font-size:1em;}
.text100{
	width: 100px;
}

</style>
<script type="text/javascript">
function checkIt() {
	var userinput = eval("document.userinput");
	
	if(!userinput.c_name.value) {
		alert("사업자 번호를 인증 받으세요");
		$("#_c_num1").focus();
		return false;
	}
 	if(!userinput.p_name.value) {
		alert("대표자명을 입력하세요");
		$("#_p_name").focus();
		return false;
	}
	if(!userinput.c_cond.value) {
		alert("업태명을 입력하세요");
		$("#_c_cond").focus();
		return false;
	}
	if(!userinput.c_type.value) {
		alert("종목명을 입력하세요");
		$("#_c_type").focus();
		return false;
	}
	if(!userinput.ic_name.value) {
		alert("담당자명을 입력하세요");
		$("#_ic_name").focus();
		return false;
	}
	if(!userinput.ic_email1.value) {
		alert("담당이메일을 입력하세요");
		$("#_ic_email1").focus();
		return false;
	}
	if(!userinput.ic_email2.value) {
		alert("담당이메일을 입력하세요");
		$("#_email2").focus();
		return false;
	}
	if(!userinput.c_address.value) {
		alert("회사 주소를 입력하세요");
		$("#_address").focus();
		return false;
	}
		if(!userinput.s_address.value) {
		alert("출고지 주소를 입력하세요");
		$("#S_address").focus();
		return false;
	}
	if(!userinput.r_address.value) {
		alert("교환/반품 주소를 입력하세요");
		$("#R_address").focus();
		return false;
	}
	
	// 전화번호
	if(!userinput.textresult.value){
		alert("담당자 번호를 입력하세요");
		$("#textresult").focus();
		return false;
	}
	
}
</script>
</head>


<body>
<h3>rhymes 사업자샐러회원 정보입력</h3>

<form action="/member/addsellerdetail" name="userinput" onsubmit="return checkIt()" method="get">
<div id="body">
	<table border="1">
	<tr>
		<td>
			<p>아이디: ${seller.id }</p>
		</td>
	</tr>
	<tr>
		<td>
		사업자 등록번호 : <input type="number" name="c_num1" class="text100" id="_c_num1" minlength="3" maxlength="3">
						- <input type="number" name="c_num2" class="text100" minlength="2" maxlength="2">
						- <input type="number" name="c_num3" class="text100" minlength="5" maxlength="5">
		</td>
		<td>
			<input type="button" value="사업자 번호 인증">
		</td>
	</tr>
	<tr>
		<td>
			상호명 : <input type="text" name="c_name">
		</td>
		</tr>
	<tr>
		<td>
		대표자명 : <input type="text" name="p_name" id="_p_name">
		</td>
	</tr>
	<tr>
		<td>
			업태 : <input type="text" name="c_cond" id="_c_cond">
		</td>
	</tr>
	<tr>
		<td>
			종목 : <input type="text" name="c_type" id="_c_type">
		</td>
	</tr>
	<tr>
		<td>
			담당자이름 : <input type="text" name="ic_name" id="_ic_name">
		</td>
	</tr>
	<tr>
		<td>
			담당자번호 : <!-- <select name="ic_phone1" class="text100">
							<option value="xx" id="_ic_phone1">선택</option>
							<option value="02">02</option>
							<option value="010">010</option>
							<option value="070">070</option>
						</select>
						-
						<input type="number" name="ic_phone2" class="text100">
						-
						<input type="number" name="ic_phone3" class="text100"> -->
						<input type="number" id="to" name="to" minlength="11" maxlength="11"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
    					<input type="button" id="send" value="전송"/><br> <!-- 문자보내는 전송버튼 -->
    					인증번호 :    <input type="number" id="userNum" class="text100">   <!-- 인증번호 입력창 -->
  									<input type="button" id="enterBtn" value="확인">   <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
  									<input type="hidden" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
  									<input type="hidden" id="textresult" name="textresult">
  									
		</td>
	</tr>
	<tr>
		<td>
			담당자메일 :  <input type="text" name="ic_email1" class="text100" id="_ic_email1">
						@
						<input type="text" name="ic_email2" class="text100" id="_email2">
						<select name="ic_email3" class="text100" id="_emailSelect" onchange="changeEmail()">
							<option value="x">직접입력</option>
							<option value="n">naver.com</option>
							<option value="h">hanmail.net</option>
							<option value="g">gmail.com</option>
						</select>
		</td>
	</tr>
	<tr>
		<td>
			회사주소 :
			<div class="wrap-input100 bg1 rs1-wrap-input100">
				<input type="text" id="_postcode" name="c_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="_address" name="c_address" placeholder="주소"><br>
				<input type="text" id="_detailAddress" name="c_detailAddress" placeholder="상세주소">
				<input type="text" id="_extraAddress" name="c_extraAddress" placeholder="참고항목">
			</div>
		</td>
	</tr>
	<tr>
		<td>
			출고지주소 : 
			<div class="wrap-input100 bg1 rs1-wrap-input100">
				<input type="text" id="S_postcode" name="s_postcode" placeholder="우편번호">
				<input type="button" onclick="S_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="S_address" name="s_address" placeholder="주소"><br>
				<input type="text" id="S_detailAddress" name="s_detailAddress" placeholder="상세주소">
				<input type="text" id="S_extraAddress" name="s_extraAddress" placeholder="참고항목">
			</div>
		</td>
	</tr>
	<tr>
		<td>
			반품/교환지주소 :
			<div class="wrap-input100 bg1 rs1-wrap-input100">
				<input type="text" id="R_postcode" name="r_postcode" placeholder="우편번호">
				<input type="button" onclick="R_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="R_address" name="r_address" placeholder="주소"><br>
				<input type="text" id="R_detailAddress" name="r_detailAddress" placeholder="상세주소">
				<input type="text" id="R_extraAddress" name="r_extraAddress" placeholder="참고항목">
			</div>
		</td>
	</tr>
	
	</table>
</div>
<div id="footer">
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="javascript:window.location.href='login'">
</div>
</form>
</body>
<script>
var count = 0; /* 문자 중복을 막기 위한 인증번호 */

$(document).ready(function() {

   $("#send").click(function() {
      
      var number = Math.floor(Math.random() * 100000) + 100000;
         if(number>100000){
            number = number - 10000;
         }

         $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
      
      var to = $("#to").val();
      
      if(to == "" || to == null){
         alert("빈칸이나 공백을 채워주세요");
      }
      
      else {
      var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
         
         if(con_test == true){
              
            if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
 
              $.ajax({
                  url:"sendSms.do",
                  type:"get",
                  data:{to: $("#to").val(),
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




<script>
function changeEmail(){
    var langSelect = document.getElementById("_emailSelect");
//	alert("langSelect: " + langSelect);
	
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
//	alert("selectValue: " + selectValue);
	
    var selectText = langSelect.options[langSelect.selectedIndex].text;
//	alert("selectText: " + selectText);
	
	if(selectText=='naver.com' || selectText=='hanmail.net' ||selectText=='gmail.com'){
		var textemail = document.getElementById("_email2").value=selectText;
	//	alert("textemail: " + textemail);		
	}
	if(selectText=='직접입력'){
		var textemail = document.getElementById("_email2").value="";
	}
	
	
}
</script>



<!-- 회사주소 -->
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


<!-- 출고지주소 -->
<script>
    function S_execDaumPostcode() {
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
                    document.getElementById("S_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("S_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('S_postcode').value = data.zonecode;
                document.getElementById("S_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("S_detailAddress").focus();
            }
        }).open();
    }
</script>


<!-- 반품/교환지주소 -->
<script>
    function R_execDaumPostcode() {
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
                    document.getElementById("R_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("R_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('R_postcode').value = data.zonecode;
                document.getElementById("R_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("R_detailAddress").focus();
            }
        }).open();
    }
</script>


</html>