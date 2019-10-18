$(document).ready(function () {
	//alert("payment.js");
	
		
	
});



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
	
	var send_name = $("#send_name").val();
	var send_phone = $("#send_phone1").val() + "-" + $("#send_phone2").val() + "-" + $("#send_phone3").val();
	var send_email = $("#send_email").val();

	var receive_name = $("#receive_name").val();
	var receive_phone = $("#receive_phone1").val() + "-" + $("#receive_phone2").val() + "-" + $("#receive_phone3").val();
	var receive_postnum = $("#sample6_postcode").val();
	var receive_address = $("#sample6_address").val() + " " + $("#sample6_detailAddress").val();
	var receive_address_request = $("#receive_address_request").val();
	
	$("#receive_phone").val( receive_phone );

		
	var add_point = $("#add_point").val()
	var disc_point = $("#disc_point").val();
	var total_price = $("#total_price").val();
	
	// form으로 submit 할 때 보내는 총 결제금액
	$("#totalprice").val( total_price );
	
	
	var disc_coupon = $("#disc_coupon").val();
	var disc_point = $("#disc_point").val();
	var add_point = $("#add_point").val();
	
	$("#payment_method").val( radioVal );
	add_point = parseInt(total_price) * 0.02;
	
	//alert("적립금1 : --- " + add_point );
	
	if( coupon_use_func == "적립" ) {
		//alert("적립");
		add_point = parseInt(add_point) + parseInt(coupon_use_func_num);
	}
	//alert("적립금2 : --- " + add_point );
	$("#add_point").val( add_point );
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp50599923');  // 가맹점 식별 코드

	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : radioVal,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : totalprice,
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
	        
	        $("#payment_code").val( rsp.imp_uid );
	        $("#receipt_url").val( rsp.receipt_url );
	        $("#vbank_num").val( rsp.vbank_num );
	        $("#vbank_name").val( rsp.vbank_name );
	        $("#vbank_date").val( rsp.vbank_date );
	        $("#vbank_holder").val( rsp.vbank_holder );
	        $("#card_apply_num").val( rsp.apply_num );
	        $("#payment_status").val( rsp.status );
	        $("#receive_address").val( rsp.buyer_addr );
	        $("#send_phone").val( rsp.buyer_tel );

	        /*
	        location.href = '/paymentAf?paid_amount='+rsp.paid_amount+'&imp_uid='+rsp.imp_uid
	        		+'&status='+rsp.status+'&pay_method='+rsp.pay_method+'&receipt_url='+rsp.receipt_url
	        		+'&vbank_num='+rsp.vbank_num+'&vbank_name='+rsp.vbank_name
	        		+'&vbank_date='+rsp.vbank_date+'&vbank_holder='+rsp.vbank_holder
	        		+'&buyer_name='+rsp.buyer_name+'&buyer_postcode='+rsp.buyer_postcode
	        		+'&buyer_tel='+rsp.buyer_tel+'&buyer_addr='+rsp.buyer_addr+'&buyer_addr_request='+rsp.custom_data; //완료페이지로 이동
	         */
	        
	        $("#payment_frm").attr("action", "/paymentAf").submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '\n에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
}


