$(function(){
	//alert("비회원 인증 페이지");

	$("#ordercheck_confirm_btn").click(function () {		
		var code = $("#ordercheck_confirm_payment_code").val();
		var name = $("#ordercheck_confirm_send_name").val();

		alert("name : " + name + ", code : " + code);
		
		$.ajax({
			url:"/Rhymes/ordercheck",
			data:"name="+name+"&code="+code,
			success:function(data){
				if(data == "true"){
					location.href="/Rhymes/";
				}else{
					alert("주문번호와 주문자 이름을 확인해주세요");
				}
			}
		}); // ajax
		
	});
	
});
