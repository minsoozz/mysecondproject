/**
 * 
 */

$(function(){
	$(".page-item .page-num").click(function(){
		var pageNum = $(this).text().trim();
		$("#_currPageNum").val(pageNum);
		$("#_frm").submit();
	});
});

function conditionChanged(){
	$("#_currPageNum").val(1);
	$("#_frm").submit();
}