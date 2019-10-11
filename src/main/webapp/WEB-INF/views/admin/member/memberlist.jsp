<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    
    <title>memberlist</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%--     <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/member/mem_styles.css"> --%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/commmon/sb-admin-2.min.css">

</head>
<script type="text/javascript">
$( "#create-user" ).button().on( "click", function() {
    dialog.dialog( "open" );
  });

</script>
<body>

<!-- page container area start -->
<div class="page-container">

    <!-- main content area start -->
<div class="main-content">

    <!-- page title area start -->

<div class="col-xs-6">
    <div class="breadcrumbs-area clearfix">
        <h4 class="page-title pull-left">Memlist</h4>
    </div>
</div>

<!-- page title area end -->
<div class="main-content-inner">
    <!-- sales report area start -->

<!-- sales report area end -->
<!-- overview area start -->

<!-- overview area end -->
<!-- market value area start -->
<div class="row mt-5 mb-5">
    <div class="col-xs-12">
        <div class="card">
            <div class="card-body">
                <div class="d-sm-flex justify-content-between align-items-center">
                    <h4 class="header-title mb-0">회원 목록</h4>
                    <select class="custome-select border-0 pr-3" name="authority" id="_authority" onchange="auth()">
                        <option selected value="0">전체</option>
                        <option value="1">일반회원</option>
                        <option value="2">업체</option>
                        <option value="3">개인판매자</option>
                    </select>
                </div>
                
                <div class="market-status-table mt-4">
                    <div class="table-responsive">
                    
<form action="memlist" id="_frm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table class="dbkit-table">
	<col width="10%"><col width="50%"><col width="50%"><col width="80%">
	<col width="80%"><col width="60%"><col width="30%"><col width="80%">
	    <tr class="heading-td">
	        <th class="list_checkbox"><input type="checkbox" name='allckeck' onclick='allchecks(this.checked)' id='_allck'></th>
	        <th class="list_id">아이디</th>
	        <th class="list_name">이름</th>
	        <th class="list_address">주소</th>
	        <th class="list_email">이메일</th>
	        <th class="list_phone">전화번호</th>
	        <th class="list_social">종류</th>
	        <th class="list_rdate">가입일</th>
	    </tr>
	    
	    <c:if test="${empty memlist }">
		<tr>
			<td colspan="8" align="center">검색결과가 없습니다.</td>
		</tr>
		</c:if>
		
		<c:forEach var="mem" items="${memlist }" varStatus="vs">
		<tr>
		    <td class="list_checkbox">
		    	<input type="checkbox" name='allck' value="${mem.seq }">
		    </td>
		    <td class="list_id"><a href="mem_update?id=${mem.userid }">${mem.userid }</a></td>
		  <td class="list_name">${mem.username }</td>
		  <td class="list_address">${mem.address }</td>
		  <td class="list_email">${mem.useremail }</td>
		  <td class="list_phone">${mem.phone }</td>
		  <td class="list_social">${mem.social}</td>
		  <td class="list_rdate">${mem.rdate }</td>
		</tr>
		</c:forEach>
	</table>
	<br><br>
	<div align="center">
	<select id="_s_category" name="s_category" onchange="categorychange()">
		<option value="" selected="selected">선택</option>
		<option value="01" <c:out value="${s_category == '01'? 'selected':'' }"/>>아이디</option>
		<option value="02"<c:out value="${s_category == '02'? 'selected':'' }"/>>이메일</option>
		<option value="03"<c:out value="${s_category == '03'? 'selected':'' }"/>>종류</option>
		<option value="04"<c:out value="${s_category == '04'? 'selected':'' }"/>>전화번호</option>
	</select>

	<!-- 검색 -->
	<input type="text" id="_s_keyword" name="s_keyword" value="">
	<input type="button" value="검색" id="_btnSearch">
	
	<!-- hidden 을 통해서 값을 넘겨주기 -->
	<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<!-- 검색끝 -->
</div>
</form>

</div>
<br>

<!-- 페이징 -->
<div id="paging_wrap"> 
	<jsp:include page="/WEB-INF/views/admin/member/paging.jsp" flush="false">
		<jsp:param name="pageNumber" value="${pageNumber }"/>
		<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
	</jsp:include>
</div>
<!-- 페이징끝 -->
                        

    
</div>
<div align="right">
	<input type="button" id="delBtn"  value="탈퇴">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- main content area end -->










</div>
<!-- page container area end -->
   
    <!-- jquery latest version -->
    <script src="<%=request.getContextPath() %>/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="<%=request.getContextPath() %>/js/bootstrap/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/admin/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/admin/metisMenu.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery/jquery.slimscroll.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
<%--     <script src="<%=request.getContextPath() %>/js/chart/line-chart.js"></script> --%>
    <!-- all pie chart -->
<%--     <script src="<%=request.getContextPath() %>/js/chart/pie-chart.js"></script> --%>
    <!-- others plugins -->
<%--     <script src="<%=request.getContextPath() %>/js/others/plugins.js"></script> --%>
<%--     <script src="<%=request.getContextPath() %>/js/others/scripts.js"></script> --%>
</body>

<script type="text/javascript">
function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frm").attr("action", "memlist").submit(); //
	
}

$("#_btnSearch").click(function () {
	//alert("클릭");
	$("#_frm").attr("action", "memlist").submit(); //
});

</script>

<script type="text/javascript">

function allchecks(e) {
	// 모두 체크
	var arr = document.getElementsByName("allck");
	
	for(i=0; i<arr.length; i++){
		arr[i].checked = e;
	}
}

$("#delBtn").click(function(){
	
});

function auth() {
	$("#_authority").click(function(){
		alert("test");
	// 	location.href="/admin/memlist".submit();
	});
)
</script>
</html>
