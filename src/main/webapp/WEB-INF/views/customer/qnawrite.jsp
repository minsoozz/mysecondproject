<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!--모달 -->
 <style>
        /* The Modal (background) */
        .modal2 {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content2 {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 40px;
            border: 1px solid #888;
            width: 40%; /* Could be more or less, depending on screen size */                          
        }


 
</style>

   
<form id="_frmForm" action="qnaupload" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th rowspan="2">제목</th>
	<td colspan="3">
		<select id="category" name="category">
		  <option value="" selected="selected">선택</option>
		  <option value="배송문의">배송문의</option>
	      <option value="취소/교환/반품">취소/교환/반품</option>
	      <option value="주문결제문의">주문결제문의</option>
	      <option value="회원정보문의">회원정보문의</option>
	      <option value="쿠폰/적립금">쿠폰/적립금</option>
	      <option value="서비스 이용 및 기타">서비스 이용 및 기타</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan="3"><input type="text" name="title" id="title" style="width: 95%;"></td>
</tr>

<tr>
	<th>주문번호</th>
	<td><input type="text" id="_OrderPickNum" name="orderno" readonly><input type="button" id="_OrderNum" value="주문조회"></td>
</tr>


<tr>
	<th>작성자</th>
	<td colspan="3">
	<input type="text" name="id" size="50" value="${id }" readonly>
	</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea style="height:268px;width:1025px;" id="content" name="content"></textarea>
	</td>
</tr>

<tr>
	<th>이미지</th>
	<td colspan="3">
		<input type="file" name="fileload" style="width: 400px">
	</td>
</tr>
</table>    

<div>
		<button type="button" class="customer-btn2" id="_btnWrite">저장</button>

		<button type="button" class="customer-btn2"  id="_btnBack">목록</button>
</div>

</form>


 <!-- The Modal -->
    <div id="myModal2" class="modal2">
 
      <!-- Modal content -->
      <div class="modal-content2">
                문의하실 주문번호를 선택하세요.
                <table style="font-size: 7px; border: solid; 1" >
                <col width="100"><col width="100"><col width="200"><col width="100"><col width="50">
                <thead>
					<tr>
						<th>주문번호</th><th>주문일자</th><th>상품명</th><th>주문금액</th><th>선택</th>
					</tr>
				</thead>
                
                <tbody>
				<c:if test="${empty orderlist }">
					<tr>
						<td colspan="5">주문내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="order" items="${orderlist }" varStatus="vs">
				<tr>
					<td>${fn:substring(order.payment_code,4,16)}</td>
					<td>${fn:substring(order.rdate,0,10)}</td>
					<td>
						${order.p_name}<c:if test="${order.count > 1 }">&nbsp;외 ${order.count - 1 }건</c:if>
					</td> 
					<td>${order.totalprice }</td>
					<td><input type="radio" class="radio_btn" name="pick" value="${fn:substring(order.payment_code,4,16)}" onclick="orderpick(this)"> </td>
				</tr>
				</c:forEach>
				
				</tbody>
                </table>
                
            <div style="cursor:pointer;text-align: center; float: right;">
                <img src="../img/customer-img/popup_close.png" onclick="close_pop();">
            </div>
      </div>
 
    </div>
        <!--End Modal-->





<script type="text/javascript">

$("#_btnWrite").click(function () {

	$("#_frmForm").attr("action", "qnaupload").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "qnalist";
});

$("#_btnWrite").mousedown(function() {
	if($("#category").val()==""){
		alert("카테고리를 선택해주세요");
		return;
	}else if($("#content").val()==""){
		alert("내용을 입력해주세요");
		return;
	}else if($("#title").val()==""){
		alert("제목을 입력해주세요");
		return;
	}
});
</script>

<script type="text/javascript">
$("#_OrderNum").click(function () {
  
        jQuery(document).ready(function() {
                $('#myModal2').show();
        });

});

function orderpick( me ) {	// 선택한주문번호 넘겨주기
	var num = me.value;
	$("#_OrderPickNum").val(num);
	 $('#myModal2').hide();

	
}


//팝업 Close 기능
function close_pop(flag) {
     $('#myModal2').hide();
};
    </script>
