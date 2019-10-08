/**
 * 
 */
$(function(){
	console.log(123123);
});


//작성가능 후기 뷰 로드
function getUnWrittenReviews(pageNum){
	$(".review_main_wrap").load('/mypage/review/review_sub_wait?pageNum=' + pageNum);
}

//작성된 후기 뷰 로드
function getWrittenReviews(pageNum){
	$(".review_main_wrap").load('/mypage/review/review_sub_done?pageNum=' + pageNum);
}