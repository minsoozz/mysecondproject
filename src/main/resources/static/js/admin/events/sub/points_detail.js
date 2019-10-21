/**
 * 
 */

$(function(){
	$(".page-item .page-num").click(function(){
		var pageNum = $(this).text().trim();
		$("#_currPageNum").val(pageNum);
		$("#_frm").submit();
	});
	
	$(".points_row").click(function(){
		$("#_points_detail_modal").modal();
	});
});

function conditionChanged(){
	$("#_currPageNum").val(1);
	$("#_frm").submit();
}