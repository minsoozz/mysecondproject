$(document).ready(function () {
	//alert("어드민 주문");
	
	$("#_btnSearch").click(function () {
		//alert("검색");
		
		var _s_keyword = $("#_s_keyword").val();
		var _select = $("#_select").val();
		alert( _s_keyword );
		alert( _select );
		
		$("#_payment_frm").attr("action","/admin/payment/success").submit();
		
	});
	
	
});




function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber); // 들어오는 값을 가져옴
	$("#_payment_frm").attr("action", "/admin/payment/success").submit();
}


