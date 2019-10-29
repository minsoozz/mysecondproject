$(document).ready(function () {
	//alert("액셀");
	
	// 회원 정보 전부 가져오기
	$("#member_down").click(function () {
		//alert("회원 정보 다운로드");		
		location.href="/admin/excel/member";
	});
	
	// 결제 내역 정보 전부 가져오기
	$("#payment_down").click(function () {
		//alert("결제내역 다운로드");		
		location.href="/admin/excel/payment";
	});
	
	// 상품 정보 전부 가져오기
	$("#product_down").click(function () {
		//alert("상품 정보 다운로드");		
		location.href="/admin/excel/product";
	});
	
	// 업체별 상품정보
	$("#com_product_down").click(function () {
		location.href="/admin/company/excel/product";
	});
	
	// 업체별 결제정보
	$("#com_payment_down").click(function () {
		location.href="/admin/company/excel/payment";
	});

});
