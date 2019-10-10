<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<!-- 후기 작성 대기중 목록 뷰 -->
<!-- attr  
	mRPDto : 페이징DTO
	reviewMap : 주문번호로 그루핑된 후기 Map
	reviewMapKeyset : Map의 키셋
 --> 
<c:choose>
	<c:when test="${dto.review_written == 'true' }">
		<div class="waiting_items_wrap">
	</c:when>
	<c:otherwise>
		<div class="written_reviews_wrap">
	</c:otherwise>
</c:choose>
<c:forEach var="list" items="${reviewMap }">
	<div class="order_item">
		<div class="order_id" align="left">
			<a class="order_id_detail">주문번호 ${fn:substring(list.key,4,16) }</a>
		</div>
	<c:forEach var="dto" items="${list.value }">
		<div class="waiting_item">
	<div class="form-group">
		<div class="form-row">
				<div class="col-md-2 img_waiting_item">
					<img onerror="this.src='https://i.ytimg.com/vi/vWMCCZEkrKg/maxresdefault.jpg'" src="<%=ctx %>/upload/store/${dto.img }">
				</div>
				<div class="col-md-5 detail_waiting_item">
					<div class="form-row">${dto.p_name }</div>
					<div class="form-row">${dto.p_title }</div>
					<div class="form-row">${dto.ea }개 구매</div>
				</div>
				<div class="col-md-3 delivery_waiting_item">
					${dto.final_status }
				</div>
				<div class="col-md-2 writenew_waiting_item">
					<c:choose>
						<c:when test="${dto.review_written == 'true' }">
							<input type="button" class="btn btn-default btn_order_body btn_write_review" value="후기 확인"><br>
						</c:when>
						<c:otherwise>
							<input type="button" class="btn btn-default btn_order_body btn_write_review" value="후기 쓰기"><br>
						</c:otherwise>
					</c:choose>					
				</div>
			</div>
		</div>
		</div>	
	</c:forEach>
	</div>
	<br>
</c:forEach>
</div>
<div class="mypage_paging review_paging" align="center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    
	    <c:forEach begin="${mRPDto.firstNavIndex }" end="${mRPDto.lastNavIndex }" step="1" var="i">
	    	<li class="page-item"><a class="page-link" href="#review_title" onclick="getUnWrittenReviews(${i});">${i }</a></li>
	    </c:forEach>
	    
	    
	    <!-- <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>

</html>