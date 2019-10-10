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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/member/memupdate_styles.css">

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
    <script src="<%=request.getContextPath() %>/js/chart/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="<%=request.getContextPath() %>/js/chart/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="<%=request.getContextPath() %>/js/others/plugins.js"></script>
    <script src="<%=request.getContextPath() %>/js/others/scripts.js"></script>


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

<div class="col-sm-6">
    <div class="breadcrumbs-area clearfix">
        <h4 class="page-title pull-left">Memupdate</h4>
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
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                
                
                <div class="market-status-table mt-4">
                    <div class="table-responsive">
                    

<form action="mem_updateAf">
<input type="hidden" value="${admem.userid }" name="userid">
	<table>
		<tr>
			<th>아이디</th>
			<td>${admem.userid }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
			<input type="text" name="username" value="${admem.username }" class="inputtext_s">
			</td>
		</tr>
		<tr>
			<th>
				<span class="th_title">주소</span>
			</th>
			<td>
				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<input type="text" id="_postcode" name="postcode" class="inputtext_s" placeholder="우편번호" value="${admem.postcode }">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="regibutton"><br>
					<input type="text" id="_address" name="address" class="inputtext_s" placeholder="주소" value="${admem.address }"><br>
					<input type="text" id="_detailAddress" name="detailAddress" class="inputtext_s" placeholder="상세주소" value="${admem.detailAddress }">
					<input type="hidden" id="_extraAddress" name="c_extraAddress" placeholder="참고항목">
				</div>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
			<input type="text" name="useremail" value="${admem.useremail }" class="inputtext_s">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
			<input type="text" name="phone" value="${admem.phone }" class="inputtext_s">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			<c:if test="${admem.usergender eq 'female' }">
				<input type="radio" name="usergender" value="female" class="addinfo radiobtn" checked>여자
				<input type="radio" name="usergender" value="male" class="addinfo radiobtn">남자
			</c:if>
			<c:if test="${admem.usergender eq 'male' }">
				<input type="radio" name="usergender" value="female" class="addinfo radiobtn" >여자
				<input type="radio" name="usergender" value="male" class="addinfo radiobtn" checked>남자
			</c:if>
			<c:if test="${empty admem.usergender }">
				<input type="radio" name="usergender" value="female" class="addinfo radiobtn" >여자
				<input type="radio" name="usergender" value="male" class="addinfo radiobtn">남자
			</c:if>
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>
			<input type="text" name="userbirth" value="${admem.userbirth }" class="inputtext_s">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" class="regibutton_s" value="수정">
				<button type="button" class="regibutton_s" id="golist">취소</button>
				
			</td>
		</tr>
		
		
	</table>
</form>


					</div>
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
   

</body>


<script type="text/javascript">
$("#golist").click(function(){
	location.href="/admin/memlist";
});

</script>

<!-- 주소 -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('_postcode').value = data.zonecode;
                document.getElementById("_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("_detailAddress").focus();
            }
        }).open();
    }
</script>

</html>
