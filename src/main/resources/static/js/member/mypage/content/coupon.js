/**
 * 
 */

$(function() {
	
	var ctx = window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));

	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	// 쿠폰등록 버튼 클릭 이벤트
	$("#_btn_regi_new_coupon").click(function() {
		
		// 배열 초기화
		var viewData = {};
		// data[키] = 밸류
		viewData["coup_code"] = $("#_txt_coupon_input").val().trim();	

		$.ajax({
			contentType : 'application/json',
			dataType : 'json',
			url : ctx + '/coupon/regicoupon',
			type : 'post',
			async : false,
			data : JSON.stringify(viewData),
			success : function(resp) {
				alert(resp);
			},
			error : function() {
				alert('전송에러');
			}
		});
	});

});