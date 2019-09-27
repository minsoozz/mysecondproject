/**
 * 
 */


var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(function() {

	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	// 확인버튼 클릭 이벤트
	$("#_btn_confirm_mem").click(function() {
		
		var queryString = $("form[name=frm_confirm_mem]").serialize() ;
		         		
		// 배열 초기화
		var viewData = {};
		// data[키] = 밸류
		viewData["_csrf"] = 'ㅁㄴㅇㅁㄴㅇ';
		
		$.ajax({
			contentType : 'application/json',
			dataType : 'json',
			url : ctx + '/personal/confirmpw',
			type : 'post',
			async : false,
			data : queryString,
			success : function( resp ) {
				console.log('성공' + resp);				
			},
			error : function() {
				console.log('실패');
			}
		});
	});

});

