/*
	functions.js
*/
//document.getElementById("date").innerHTML = new Date().toLocaleTimeString();

var navContainer = document.getElementById("navbarResponsive");

var navItems = navContainer.getElementsByTagName("li");

for (var i = 0; i < navItems.length; i++) {
  btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}

//navItems[0].className += " active";