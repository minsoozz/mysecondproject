$(function () {
	
	$("#ordercheck_confirm_btn").click(function () {
		var code = $("#ordercheck_confirm_payment_code").val();
		var name = $("#ordercheck_confirm_send_name").val();
		
		if(code == "" || name == "") {
			alert("주문번호와 주문자 이름을 확인해주세요");
			return;
		}

		alert("code : " + code + ", name : " + name);
		
		$.ajax({
			url:"/Rhymes/ordercheck_nomembership_confirm",
			data:"name="+name+"&code="+code,
			success:function(data){
				if(data == "true"){
					location.href="/Rhymes/ordercheck_detail_move";
				}else{
					alert("일치하는 주문이 없습니다.\n확인 후  다시 시도해 주십시오.");
				}
			}
		}); // ajax
		
	});
	
	$("#ordercheck_detail_print").click(function () {
		alert("내역 확인");
	});

});



function ordercheck_detail(){
	alert("주문상세보기");
}



function ordercheck_delivery(){
	alert("배송현황보기");
}



function ordercheck_review(){
	alert("상품후기쓰기");
}


