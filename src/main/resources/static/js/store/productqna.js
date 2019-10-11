/**
 * 
 */
$(function(){

});

//작성된 후기 뷰 로드
function getProductQna(pageNumber){
	$("#_product_qna").load('/productqna/pqnalist?pageNumber='+pageNumber);
}