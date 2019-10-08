<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<div class="sidenav">

  <button class="dropdown-btn">WOMEN
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container" class="_cate2list">
    <c:forEach items="${cate2Wlist }" var="cate2W" varStatus="vs">
    	<a href="#" onclick="">${cate2W.c2_name }</a>
    </c:forEach>
  </div>
  
   <button class="dropdown-btn">MEN
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container" class="_cate2list">
    <c:forEach items="${cate2Mlist }" var="cate2M" varStatus="vs">
    	<a href="#" onclick="">${cate2M.c2_name }</a>
    </c:forEach>

  </div>
  
   <button class="dropdown-btn">BRAND
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <c:forEach items="${clist }" var="co" varStatus="vs">
    	<a href="#" class="brandClick">${co }</a>
    </c:forEach>
  </div>
  
  <a href="#contact">Search</a>
</div>

<body>

<!--------------------- SCRIPTZONE ----------------------------------->
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click', '.brandClick', function(){
		var c_name = $(this).html();
		alert(c_name);
				
	});	
});


//* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {    	
      dropdownContent.style.display = "none";      
    } else {
      dropdownContent.style.display = "block";
    }
  });
}

/* 회사이름 sorting */
 function cnameMove(c_name){
	alert(c_name);
}

</script>
</body>