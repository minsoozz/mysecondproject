<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
 
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<script src="<%=ctx%>/vendor/ckeditor/ckfinder/ckfinder.js"></script>

<script src="<%=ctx%>/js/member/mypage/content/sub/review_write_new.js"></script>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/sub/review_write_new.css">

<div class="mypage_main_content_top">
	<div class="top_title mypage_main_content_title" align="left">
		<h3>상품후기</h3>
		<hr>
	</div>
</div>

<div class="editor_wrap">
   <textarea name="content" id="review_editor"></textarea>
</div>
<img alt="" src="http://192.168.0.14:18080/upload/store/15704428782241.png">
<!-- CKEditor -->
<script type="text/javascript">

ClassicEditor
	.create( document.querySelector( '#review_editor' ), {
		ckfinder: {
	        uploadUrl: '/ck/fileupload' // 내가 지정한 업로드 url (post로 요청감)
	    }
	} )
	.catch( error => {
	    console.error( error );
	} );
</script>

</html>