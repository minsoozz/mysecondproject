<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="<%=ctx%>/css/admin/events/sub/points_give.css">

<script src="https://cdn.jsdelivr.net/gh/xcash/bootstrap-autocomplete@v2.2.1/dist/latest/bootstrap-autocomplete.min.js"></script>

<div class="modal-dialog" role="document">
    <div class="modal-content">
		<div class="modal-header">
        	<h5 class="modal-title" id="pointsGiveModalLabel">적립금 지급</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="give-search-wrap"><!-- 검색영역시작 -->
				<div class="input-group">
	            	<input class="form-control basicAutoComplete" type="text" data-url="myurl" autocomplete="off">
	            </div>
			</div><!-- 검색영역끝 -->
			
			<div class="give-member-wrap">
				<table class="table table-bordered table-hover" id="_tbl_points_give">
	                <thead>
	                    <tr role="row">
	                		<th class="sorting_asc" tabindex="0" style="width: 126px;">No</th>
	                		<th class="sorting" tabindex="0" style="width: 211px;">ID</th>
	                		<th class="sorting" tabindex="0" style="width: 211px;">구분</th>
	                		<th class="sorting" tabindex="0" style="width: 211px;">금액</th>
	                	</tr>
	                </thead>
	                
                	<tbody>
                		<tr><td colspan="4">검색을 통해 유저를 추가해 주세요</td></tr>
	                	<tr role="row" class="odd">
	                    	<td>1</td>
	                    	<td>minp</td>
	                    	<td>MEMBER</td>
	                    	<td><input type="text"></td>
	                	</tr>
               		</tbody>
                </table>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			<button type="button" class="btn btn-primary" id="_give_frm_btn_save" disabled>적립금 지급</button>
		</div>
	</div>
</div>
	
</html>