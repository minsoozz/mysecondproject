<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<%-- <c:forEach begin="0" end="${fn:length(list) -1 }" step="1" varStatus="i">
ID : ${list[i.index].id }, PWD : ${list[i.index].pwd }
<br>
</c:forEach> --%>
<br><br>

<div class="divfirst" align="left">
<div class="divback">
<h1>주문서</h1>
<h6 style="padding: 10px 10px 10px 10px;">주문하실 상품명 및 수량을 정확하게 확인해 주세요</h6>
</div>
<br><br><br><br><br><br>




<div class="divback">
<h4>상품 정보</h4>
<table>
<tr style="border-bottom: 1px solid #dbdbdb;">
	<td colspan="2" align="center" width="50%">상품 정보</td>
	<td width="20%" align="center">상품 금액</td>
</tr>
<tr>
	<td rowspan="2">상품 이미지</td>
	<td width="50%" align="left">[돌쇠]무항생제 한우사골 (고기)곰탕</td>
	<td rowspan="2" width="10%" align="center">11,600</td>
</tr>
<tr>
	<td align="left">1개/개 당 11,600원</td>
</tr>
</table>
</div>
<br><br><br><br><br><br>




<div class="divback">
<h4>주문자 정보</h4>
<table>
<!--
-->
<tr>
	<th>휴대폰 번호</th>
	<td>
	<input type="text" id="to" placeholder="인증받을 전화번호">   <!-- 인증번호 받을사람 휴대폰 번호 -->	
	<input type="button" id="oneselfConfirmBtn" value="본인인증">
	&nbsp;비회원으로 구매를 원하시면, 본인인증이 필요합니다.<br>
	
	인증번호 입력 :    <input type="text" id="userNum">   <!-- 인증번호 입력창 -->
	<input type="button" id="enterBtn" value="확인">

	<input type="text" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->

	</td>
</tr>
<tr>
	<th>보내는 분 *</th>
	<td><input type="text" size="26" id="sendid"></td>
</tr>
<tr>
	<th>휴대폰 *</th>
	<td><input type="text" size="5" id="sendphone1">&nbsp;-&nbsp;
	<input type="text" size="5" id="sendphone2">&nbsp;-&nbsp;
	<input type="text" size="5" id="sendphone3"></td>
</tr><tr>
	<th>이메일 *</th>
	<td><input type="text" size="26"></td>
</tr><tr>
	<td></td>
	<td>이메일을 통해 주문처리과정을 보내드립니다.<br>이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해 주세요.</td>
</tr>
</table>
</div>
<br><br><br><br><br><br>




<div class="divback">
<h4>배송 정보</h4>
<table>
<tr>
	<th>주소 *</th>
	<td>새 배송지 추가 <input type="radio" onclick="sample4_execDaumPostcode()">
	&nbsp;&nbsp;&nbsp;&nbsp;위(주문자) 정보와 같음 <input type="radio" name="address" id="oldaddress"></td>
</tr>
<tr>
	<th></th>
	<td><input type="text" size="20" id="sample4_postcode" placeholder="우편번호">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" size="40" id="sample4_roadAddress" placeholder="도로명주소">
	<input type="text" size="40" id="sample4_jibunAddress" placeholder="지번주소"><br>
	<input type="text" size="40" id="sample4_detailAddress" placeholder="상세주소">
	<input type="text" size="40" id="sample4_extraAddress" placeholder="참고항목">
	</td>
</tr>
<tr>
	<th>수령인 이름 *</th>
	<td><input type="text" size="26" id="receiveid"></td>
</tr>
<tr>
	<th>휴대폰 *</th>
	<td><input type="text" size="5" id="receivephone1">&nbsp;-&nbsp;
	<input type="text" size="5" id="receivephone2">&nbsp;-&nbsp;
	<input type="text" size="5" id="receivephone3"></td>
</tr>
<tr>
	<th>배송 요청사항</th>
	<td><textarea rows="3" cols="70"></textarea>0지/50자</td>
</tr>
</table>
</div>
<br><br><br><br><br><br>





<!-- 로그인 했을때만 보이기 -->
<div class="divback">
<h4>쿠폰 적립금</h4>
<table>
<tr>
	<th rowspan="2">쿠폰 적용</th>
	<td>
	<select>
	<option>쿠폰 적용 안함</option>
	<option>사용할 쿠폰</option>
	</select>
	</td>
</tr>
<tr>
	<td>(보유쿠폰 : 1개)</td>
</tr>
<tr>
	<th>적립금 적용</th>
	<td>사용 가능한 적립금이 없습니다</td>
</tr>
</table>
</div>
<br><br><br><br><br><br>





<div class="divback">
<h4>결제 수단</h4>
<table>
<tr style="background-color: #fafafa">
	<th>결제 수단 선택</th>
	<td>
	신용카드 <input type="radio" name="payment" value="card">&nbsp;&nbsp;&nbsp;&nbsp;
	무통장입금 <input type="radio" name="payment" value="vbank">&nbsp;&nbsp;&nbsp;&nbsp;
	카카오페이 <input type="radio" name="payment" value="kakaopay">&nbsp;&nbsp;&nbsp;&nbsp;
	실시간 계좌이체 <input type="radio" name="payment" value="trans">&nbsp;&nbsp;&nbsp;&nbsp;
	휴대요금 결제 <input type="radio" name="payment" value="phone">
	</td>
</tr>
<tr>
	<td></td>
	<td></td>
</tr>
<tr>
	<th>결제하실 금액</th>
	<td>49,900원</td>
</tr>
</table><br>
</div>
<input type="button" id="paymentBtn" value="결제하기" onclick="paymens()"><br><br>
</div>




<script type="text/javascript">
$("#checkorder").click(function () {
	//alert("주문자와 동일");
	
	$("#receiveid").val( $("#sendid").val() );
	$("#receivephone1").val( $("#sendphone1").val() );
	$("#receivephone2").val( $("#sendphone2").val() );
	$("#receivephone3").val( $("#sendphone3").val() );
	
});



$("#oldaddress").click(function () {
	//alert("기존 배송지");

	$("#receiveid").val( $("#sendid").val() );
	$("#receivephone1").val( $("#sendphone1").val() );
	$("#receivephone2").val( $("#sendphone2").val() );
	$("#receivephone3").val( $("#sendphone3").val() );
});





function paymens(){
	var radioVal = $('input[name="payment"]:checked').val();
	//alert(radioVal);
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp50599923');  // 가맹점 식별 코드

	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : radioVal,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 150,
	    buyer_email : 'onep577@naver.com',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남대로 비트캠프',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '\n고유ID : ' + rsp.imp_uid;
	        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	        msg += '\n결제 금액 : ' + rsp.paid_amount + '원';
	        msg += '\n카드 승인번호 : ' + rsp.apply_num;
	        msg += '\n결제상황 : ' + rsp.status;
	        msg += '\n결제수단 : ' + rsp.pay_method;
	        msg += '\n가상계좌 : ' + rsp.vbank_num;

	        location.href = '/payment/paymentAf?paid_amount='+rsp.paid_amount+'&imp_uid='+rsp.imp_uid
	        		+'&status='+rsp.status+'&pay_method='+rsp.pay_method+'&receipt_url='+rsp.receipt_url
	        		+'&vbank_num='+rsp.vbank_num+'&vbank_name='+rsp.vbank_name
	        		+'&vbank_date='+rsp.vbank_date+'&vbank_holder='+rsp.vbank_holder; //완료페이지로 이동

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '\n에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
}



var count = 0; /* 문자 중복을 막기 위한 인증번호 */

$("#oneselfConfirmBtn").click(function() {
	alert("본인인증1");
	
	var number = Math.floor(Math.random() * 100000) + 100000;
	if(number>100000){
		number = number - 10000;
	}
	
	$("#text").val(number);      /* 난수로 생성된 인증번호를 hidden id : confirmnumber 에 숨긴다 */
	var text = $("#text").val();
	var to = $("#to").val();
	
	if(to == "" || to == null){
		alert("빈칸이나 공백을 채워주세요");
	}else {
		var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
		
		if(con_test == true){
			if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
				
				alert("text : " + text + ", to : " + to);
				
				$.ajax({
					url:"/Rhymes/sendsms",
					type:"get",
					data:{
						to: to,
						text: text
				},
				success:function(data){
					alert("해당 휴대폰으로 인증번호를 발송" + data + " 했습니다");
					count++;
					alert(count);
				},
				error:function(){
					alert("발송실패");
				}
			});
			
			} else {
				alert("휴대폰 인증 그만하세요");
			}
		}
	}
});





/* 내가 작성한 번호와 인증번호를 비교한다 */
$("#enterBtn").click(function() {
	alert($("#text").val());
	var userNum = $("#userNum").val();
	
	var sysNum = $("#text").val();
	
	if(userNum == null || userNum == ""){
		alert("휴대폰으로 발송된 인증번호를 입력해주세요");
	}else{
		if(userNum.trim() == sysNum.trim()){
			alert("성공");
		}else {
			alert("실패");
		}
	}
});





function sample4_execDaumPostcode() {
	alert("주소찾기");
	
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}



</script>






</body>
</html>