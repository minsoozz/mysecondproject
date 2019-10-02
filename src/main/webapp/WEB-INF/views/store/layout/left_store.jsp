<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 

<div class="sidenav">

  <button class="dropdown-btn">WOMEN
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Outer</a>
    <a href="#">Top</a>
    <a href="#">Bottom</a>
    <a href="#">Shoes</a>
    <a href="#">Accessories</a>
  </div>
  
   <button class="dropdown-btn">MEN
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Outer</a>
    <a href="#">Top</a>
    <a href="#">Bottom</a>
    <a href="#">Shoes</a>
    <a href="#">Accessories</a>

  </div>
  
   <button class="dropdown-btn">BRAND
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Link 1</a>
    <a href="#">Link 2</a>
    <a href="#">Link 3</a>
  </div>
  
  
  <a href="#contact">Search</a>
</div>


<body>
<script type="text/javascript">
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

</script>
</body>