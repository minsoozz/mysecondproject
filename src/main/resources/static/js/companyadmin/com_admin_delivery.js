$(document).ready(function () {
	//alert("어드민 주문");
	
	var delivery_status = $("#delivery_status").text();
	
	$("#allcheckid").click(function(){
		
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#allcheckid").prop("checked")) {
			
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
			
			// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	});
	
	$("#deliveryIngBtn").click(function () {
		//alert("1");
		if(delivery_status == '배송 준비중'){
			$("#delivery_frm").attr("action","/admin/company/payment/delivery/ing").submit();
		}else{
			alert("배송준비중만 배송중으로 변경 가능합니다");
		}
		
	});
	
	$("#deliveryFinishBtn").click(function () {
		//alert("2");
		if(delivery_status == '배송중'){
			$("#delivery_frm").attr("action","/admin/company/payment/delivery/finish").submit();
		}else{
			alert("배송중만 배송완료로 변경 가능합니다");
		}
	});
	
	
});
