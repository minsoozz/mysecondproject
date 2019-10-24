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
	
/*
	//쿠폰 등록대상 ID 검색 자동완성기능	
	$("#_coup_reg_id").typeahead({
		source: [
		    {id: "someId1", name: "Display name 1"},
		    {id: "someId2", name: "Display name 2"}
		],
		autoSelect: true
	});
	
	var $input = $("#_coup_reg_id");
	$input.typeahead({
	  source: [
	    {id: "someId1", name: "Display name 1"},
	    {id: "someId2", name: "Display name 2"}
	  ],
	  autoSelect: true
	});
	$input.change(function() {
		console.log(123123);
	  var current = $input.typeahead("getActive");
	  if (current) {
	    // Some item from your model is active!
	    if (current.name == $input.val()) {
	      // This means the exact match is found. Use toLowerCase() if you want case insensitive match.
	    } else {
	      // This means it is only a partial match, you can either add a new item
	      // or take the active if you don't want new items
	    }
	  } else {
	    // Nothing is active so it is a new value (or maybe empty value)
	  }
	});
*/
	
//	$("#_coup_reg_id").autocomplete({ 
//		source : function(request, response) {
//			getMemberIds(request, response);
//		},
//		minLength: 2, 
//		select : function(event, ui) {
//			//선택된 회원 ID에 맞는 정보를 테이블에 추가
//			addMemberOnTable(ui.item.value);
//		}
//	});
});

$(document).on('show.bs.modal','#_coupon_detail_info_modal', function () {
	
	var dataArr = [
	    {id: "someId1", name: "Display name 1"},
	    {id: "someId2", name: "Display name 2"}
	];
	
	$('#_coup_reg_id').typeahead({
		  minLength: 3,
		  highlight: true
		},
		{
		  name: 'my-dataset',
		  source: dataArr
	});
});


/*
$(document).on('show.bs.modal','#_coupon_detail_info_modal', function () {
	console.log('modal on show!!!!!!!!!!!');
	var $input = $("#_coup_reg_id");
	$input.typeahead({
	  source: getTypeaheadData()
	});
	
	//DB값과 같아야만 저장버튼 활성화
	$input.on('keyup change',function() {
		var dataArr = getTypeaheadData();
		$.each(dataArr, function(i, e){
			console.log( i + ' , ' + e.name);
		});
		$input.typeahead({
			source: dataArr
			  //source: getTypeaheadData()
		});
		var current = $input.typeahead("getActive");
		console.log('load ok');
		if (current) {
			console.log('curr');
			if (current.name == $input.val()) {
				console.log('equal');
				$("#_save_coup_detail_info").removeAttr('disabled');
				return true;
			}
		}
		$("#_save_coup_detail_info").attr('disabled', 'disabled');
	});

});
*/
function getTypeaheadData(){
	
	//디폴트값
	var dataArr = [
	    {id: "someId1", name: "Display name 1"},
	    {id: "someId2", name: "Display name 2"}
	];
	
	$.ajax({
		type : 'get',
		url : "/admin/mypage/points/getmembers",
		dataType : "json",
		data : {
			value : $("#_coup_reg_id").val()
		},
		async: false,
		success : function(data) {
			console.log('load ok ');
			dataArr = new Array();
			$.each(data, function(index, item) {
				dataArr.push( {id: "userid", name: "disp" } );
			});
		}
	});
	
	
//	$.each(dataArr, function(i, e){
//		console.log(i + ' , ' + e.name);
//	});
	
	return dataArr;
}

//ajax통신을 통해 검색어에 맞는 회원 ID를 리턴하는 함수
function getMemberIds(request, response){
	$.ajax({
		type : 'get',
		url : "/admin/mypage/points/getmembers",
		dataType : "json",
		data : {
			value : request.term
		},
		async: false,
		success : function(data) {					
			response($.each(data, function(index, item) {
				return {
					label : item,
					value : item
				}
			}));
		}
	});
}

//선택된 회원 ID에 맞는 정보를 테이블에 추가
function addMemberOnTable(memberid){
	$("#_coup_reg_id").attr('readonly', 'readonly');
	$("#_save_coup_detail_info").removeAttr('disabled');
}