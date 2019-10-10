<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<!-- 새 후기 작성 뷰 -->

<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/sub/review_write_new.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/sub/review_write_new.js"></script>

<div class="mypage_main_content_title" align="left">
	<h3>상품후기</h3>
	<hr>
</div>

<div style="width:70%;">
   <textarea name="content" id="summernote" style="padding-left: 36%;"></textarea>
</div>

</html>