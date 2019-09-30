/**
 * 
 */



var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(function() {
	$("#_input_pw").focus();
//	// ajax 통신을 위한 csrf 설정
//	var token = $("meta[name='_csrf']").attr("content");
//	var header = $("meta[name='_csrf_header']").attr("content");
//	$(document).ajaxSend(function(e, xhr, options) {
//		xhr.setRequestHeader(header, token);
//	});
//
//	// 확인버튼 클릭 이벤트
//	$("#_btn_confirm_mem").click(function() {
//		
//		//폼 직렬화 설정
//		var queryString = $("form[name=frm_confirm_mem]").serialize() ;
//		    
//		$.ajax({
//			contentType : 'application/json',
//			dataType : 'json',
//			url : ctx + '/personal/confirmpw',
//			type : 'post',
//			async : false,
//			data : queryString,
//			success : function( resp ) {
//				console.log('성공' + resp);				
//			},
//			error : function() {
//				console.log('실패');
//			}
//		});
//	});
	
	// 확인버튼 클릭 이벤트
	$("#_btn_confirm_mem").click(function() {
		pwChk();
	});
	
	$("#_input_pw").click(function(){
		$("#_input_pw").removeClass("is-invalid");
	});

});

function frm_ent(e){
	if(e.keyCode==13 && e.srcElement.type != 'textarea'){
		pwChk();
	}
}

function pwChk(){
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	//폼 직렬화 설정
	var queryString = $("form[name=frm_confirm_mem]").serialize() ;
	    
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : ctx + '/personal/confirmpw',
		type : 'post',
		async : false,
		data : queryString,
		success : function( resp ) {
			console.log('성공' + resp);	
			if( resp === 1){
				$(".confirm_frm_wrap").remove();
//				var $div_pf = document.createElement('div');
//				$div_pf.addClass('frm_personalform');
				
				$(".confirm_wrap").append('<div class="frm_personalform"></div>');
				//$(".frm_personalform").load(ctx + '/personalform');
				//$(".frm_personalform").load(ctx + '/member/mypage/content/personalform.jsp');
				$(".frm_personalform").load('/mypage/personalform');
			}else{
				$("#_input_pw").addClass("is-invalid");
			}
		},
		error : function() {
			console.log('실패');
		}
	});

}