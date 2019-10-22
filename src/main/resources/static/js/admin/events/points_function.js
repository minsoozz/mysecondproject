/**
 * 
 */

$(function(){	
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	//적립금 지급 버튼 클릭
	$("#_btn_give_points").click(function(){
		$("#_points_give_modal").modal();
	});
	
	//자동완성기능
	$('.basicAutoComplete').autoComplete({
	    resolverSettings: {
	        url: '/mypage/json'
	    }
	});	
});