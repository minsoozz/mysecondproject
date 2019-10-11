/**
 * 
 */
$(function(){
	/*좌측 네비게이션 메뉴 색 선택 기능*/
	var titles = ['주문 내역', '찜 목록', '상품후기', '적립금', '쿠폰', '개인 정보 수정'];
	
	var title = $(".mypage_main_content_title h3").text();
	$.each(titles, function(index, item){
		if( title === item){
			$(".btn-group-vertical").children().eq(index).css('background-color', '#D7FD75');
		}
	});
});