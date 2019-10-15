$(function(){
	alert("결제");
	result_price();

	

// 기존 배송지와 같은 장소로 전달할 때
$("#oldaddress").click(function () {
	//alert("기존 배송지");
	
	var b = $("input:checkbox[id='oldaddress']").is(":checked");
	
	if(b){
		alert("true");
		$("#receive_name").val( $("#send_name").val() );
		$("#receive_phone1").val( $("#send_phone1").val() );
		$("#receive_phone2").val( $("#send_phone2").val() );
		$("#receive_phone3").val( $("#send_phone3").val() );
	}else{
		alert("false");
		$("#receive_name").val( "" );
		$("#receive_phone1").val( "" );
		$("#receive_phone2").val( "" );
		$("#receive_phone3").val( "" );
	}

});



// 비회원으로 결제할 때
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
					url:"/sendsms",
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
	alert( $("#text").val() );
	var userNum = $("#userNum").val();
	
	var sysNum = $("#text").val();
	
	if(userNum == null || userNum == ""){
		alert("휴대폰으로 발송된 인증번호를 입력해주세요");
	}else{
		if(userNum.trim() == sysNum.trim()){
			alert("성공");
			$("#_text_confirm").val( sysNum );
		}else {
			alert("실패");
		}
	}
});


// 쿠폰 팝업창이 나온다
$("#coupon_btn").click(function () {
	window.open("/payment_coupon", "window팝업", "width=700, height=700, menubar=no, status=no, toolbar=no");
});





});





// 쿠폰변경 했을 때 결제 예정금액 변경
function count_disc_coup() {
	alert("안녕");

	result_price();
}





// 결제금액 계산
function result_price() {
	alert("ㅇㅇㅇㅇ");
	var product_price = $("#product_price").text();
	var delivery_price = $("#delivery_price").text();
	var disc_price = $("#discprice").text();
	var totalprice = $("#totalprice").text();

	$("#totalprice").text( parseInt(product_price) + parseInt(delivery_price) - parseInt(disc_price) );
}







// 적립금
function price_change() {
	//alert("적립금");
	
	var point_amount = $("#point_amount").val();
	var disc_point = $("#disc_point").val();

	//if( disc_point.trim().length == 0 ) {
	//	$("#disc_point").text( "0" );
	//}
	
	var _point_amount = parseInt(point_amount) + 1;
	var _disc_point = parseInt(disc_point) + 2;
	
	
	if( _point_amount < _disc_point ) {
		alert( $("#point_amount").val() + "원까지 사용가능합니다" );
		$("#disc_point").val("");
	}
	
	$("#discprice").text( $("#disc_point").val() );
	result_price();
}






// 결제 페이지에서 배송할 주소 검색
function sample6_execDaumPostcode() {
	alert("주소찾기");	
	
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
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}



// 결제 API
function paymens(){
	//alert(radioVal);
	var radioVal = $('input[name="payment"]:checked').val();
	
	if(radioVal == null){
		alert("결제수단을 선택해주세요");
		return;
	}
	
	var _text_confirm = $("#_text_confirm").val();
	//alert(_text_confirm);
	
	if(_text_confirm == "" ){
		alert("본인인증을 해주세요");
		return;
	}
	
	var coupon_use_func = $("#coupon_use_func").val();
	var coupon_use_func_num = $("#coupon_use_func_num").val();
	
	if( coupon_use_func == "적립" ) {
		alert("적립");
		document.payment_frm.add_point.value = coupon_use_func_num;
	}
	
	var send_name = $("#send_name").val();
	var send_phone = $("#send_phone1").val() + $("#send_phone2").val() + $("#send_phone3").val();
	var send_email = $("#send_email").val();

	var receive_name = $("#receive_name").val();
	var receive_phone = $("#receive_phone1").val() + $("#receive_phone2").val() + $("#receive_phone3").val();
	var receive_postnum = $("#sample6_postcode").val();
	var receive_address = $("#sample6_address").val() + " " + $("#sample6_detailAddress").val();
	var receive_address_request = $("#receive_address_request").val();
	
	var disc_point = $("#disc_point").val();	
	var totalprice = $("#totalprice").val();

	
	document.payment_frm.payment_method.value = radioVal;
	document.payment_frm.add_point.value = totalprice * 0.02;
	document.payment_frm.totalprice.value = totalprice;
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp50599923');  // 가맹점 식별 코드

	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : radioVal,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 150,
	    buyer_email : send_email,
	    buyer_name : send_name,
	    buyer_tel : send_phone,
	    buyer_addr : receive_address,
	    buyer_postcode : receive_postnum
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
	        msg += '\n결제시간 : ' + rsp.paid_at;

	        location.href = '/paymentAf?paid_amount='+rsp.paid_amount+'&imp_uid='+rsp.imp_uid
	        		+'&status='+rsp.status+'&pay_method='+rsp.pay_method+'&receipt_url='+rsp.receipt_url
	        		+'&vbank_num='+rsp.vbank_num+'&vbank_name='+rsp.vbank_name
	        		+'&vbank_date='+rsp.vbank_date+'&vbank_holder='+rsp.vbank_holder
	        		+'&buyer_name='+rsp.buyer_name+'&buyer_postcode='+rsp.buyer_postcode
	        		+'&buyer_tel='+rsp.buyer_tel+'&buyer_addr='+rsp.buyer_addr+'&buyer_addr_request='+rsp.custom_data; //완료페이지로 이동

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '\n에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
}


