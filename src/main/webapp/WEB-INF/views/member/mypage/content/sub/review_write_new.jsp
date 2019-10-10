<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<!-- 새 후기 작성 뷰 -->

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/sub/review_write_new.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/sub/review_write_new.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<div class="mypage_main_content_title" align="left">
	<h3>상품후기</h3>
	<hr>
</div>

<div style="width:70%;">
	<form method="post">
	  <textarea id="summernote" name="editordata"></textarea>
	</form>
</div>
끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝
<script type="text/javascript">
$(function(){
	$("#summernote").summernote();
});
</script>

</html>