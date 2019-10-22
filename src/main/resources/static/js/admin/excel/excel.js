$(document).ready(function () {
	//alert("액셀");
	
	// 
	$("#excelDownLoad").click(function () {
		//alert("액셀22");
		location.href="/admin/exceldownload";
	});
	
	// 데이터 전체 다운로드
	$("#allDownLoad").click(function () {
		alert("전체 다운로드");
		
		location.href="/admin/excel/all";
	});

});
