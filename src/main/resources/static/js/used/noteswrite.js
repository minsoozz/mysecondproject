$(function() {
	$("#autocomplete").autocomplete({
		source : function(request, response) {
			$.ajax({
				type : 'get',
				url : "/mypage/json",
				dataType : "json",
				//request.term = $("#autocomplete").val()
				data : {
					value : request.term
				},
				success : function(data) {
					//서버에서 json 데이터 response 후 목록에 뿌려주기 위함
					//                        response(
					//                            $.map(data, function(item) {
					//                                return {
					//                                    label: item.data,
					//                                    value: item.data
					//                                }
					//                            })
					//                        );
					response($.each(data, function(index, item) {
						return {
							label : item,
							value : item
						}
					}));
				}
			});
		},
		//조회를 위한 최소글자수
		minLength : 1,
		select : function(event, ui) {
			// 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
		}
	});
})

$(function() {
	$('#content').keyup(function(e) {
		var content = $(this).val();
		//  $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$('#counter').html(content.length + '/1000');
	});
	$('#content').keyup();
});

function save() {
	if ($("#_save").prop('checked') == true) 
		$("#_save").prop('checked', false);
    else 
		$("#_save").prop('checked', true);

}

$(document).ready(function() {
	$("#_send").click(function() {
		$("#_notesform").attr("action","/mypage/noteswriteAf");
		$("#_notesform").submit();
		alert("전송이 완료되었습니다~");
		window.close();
	});
})