<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 

<div class="sidenav">

 <a href="#contact">All</a>

  <button class="dropdown-btn">Outer
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">JACKET</a>
    <a href="#">COAT</a>
    <a href="#">DOWN</a>
  </div>
  <button class="dropdown-btn">Top
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">T-SHIRTS</a>
    <a href="#">SHIRT</a>
    <a href="#">SWEAT</a>
    <a href="#">KNIT</a>
  </div>
  <button class="dropdown-btn">Bottom
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">PANTS</a>
    <a href="#">JEANS</a>
    <a href="#">SHORTS</a>
  </div>
  <button class="dropdown-btn">Shoes
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">SNEAKERS</a>
    <a href="#">BOOTS</a>
    <a href="#">SANDAL</a>
    <a href="#">CLASSIC</a>
  </div>
  <button class="dropdown-btn">Accessories
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">¾Ç¼¼¾Ï²¨³ª</a>

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