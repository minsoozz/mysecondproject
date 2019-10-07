$(function(){
	//alert("비회원 인증 페이지");

	$("#ordercheck_confirm_btn").click(function () {
		var code = $("#ordercheck_confirm_payment_code").val();
		var name = $("#ordercheck_confirm_send_name").val();
		
		if(code == "" || name == "") {
			alert("주문번호와 주문자 이름을 확인해주세요");
			return;
		}

		alert("code : " + code + ", name : " + name);
		
		$.ajax({
			url:"/Rhymes/ordercheck_confirm",
			data:"name="+name+"&code="+code,
			success:function(data){
				if(data == "true"){
					location.href="/Rhymes/ordercheck_move";
				}else{
					alert("일치하는 주문이 없습니다.\n확인 후  다시 시도해 주십시오.");
				}
			}
		}); // ajax
		
	});
	
});
