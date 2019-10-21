/**
 * 
 */

$(function(){
	$(".page-item .page-num").click(function(){
		var pageNum = $(this).text().trim();
		$("#_currPageNum").val(pageNum);
		$("#_frm").submit();
	});
	
	//모달폼 데이터 적용
	$(".points_row").click(function(){		
		var tds = $(this).children();
		var items = $(".detail-input-items");		
		tds.each(function(index, item){	
			if( index === 0 ) return true;	//continue;
			console.log( index +  ' , ' + $(this).text() );
			items.eq(index-1).val( $(this).text() );
		});		
		$("#_points_detail_modal").modal();
	});
	
	
	$(".detail-input-items").eq(4).keydown(function(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) ){
			return;
		} else{
			return false;
		}
		console.log( $(this).val() );
		
	});
});

function conditionChanged(){
	$("#_currPageNum").val(1);
	$("#_frm").submit();
}