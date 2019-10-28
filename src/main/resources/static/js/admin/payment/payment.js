$(document).ready(function () {
	//alert("어드민 주문");
	
	$("#_btnSearch").click(function () {
		//alert("검색");
		
		var _s_keyword = $("#_s_keyword").val();
		var _select = $("#_select").val();
		//alert( _s_keyword );
		//alert( _select );
		
		//$("#_payment_frm").attr("action","/admin/payment/success").submit();
		location.href="/admin/payment/success?s_keyword="+_s_keyword+"&select="+_select;
	});
	
	
});



function goPage(pageNumber) {
	//alert("페이지 클릭 : " + pageNumber);
	
	var _s_keyword = $("#_s_keyword").val();
	var _select = $("#_select").val();

	$("#_pageNumber").val(pageNumber); // 들어오는 값을 가져옴
	var _pageNumber = $("#_pageNumber").val();
	//$("#_payment_frm").attr("action", "/admin/payment/success").submit();

	location.href="/admin/payment/success?s_keyword="+_s_keyword+"&select="+_select+"&pageNumber="+_pageNumber;
}


