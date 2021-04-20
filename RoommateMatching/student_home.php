<?php include "includes/header.php";
	?>
<!doctype html>
<html lange="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Student | Home</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">

  <!-- Main stylesheet -->
	<link rel="stylesheet" href="css/main.css">

  <!-- Add custom styles for this page here -->

</head>

<body>
  <!-- Navigation -->
	<?php 
		include "includes/student_nav.php";
	?>
	
  <!-- Header -->
  <header class="bg-info py-5 mb-5">
    <div class="container h-50" style="max-height:10%">
      <div class="row h-50 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">
			  Find Your Roommate Now!</h1>
          <p class="lead mb-5 text-white-50">Manage your profile information, update personal profile information and preferences for roommates.</p>
        </div>
      </div>
    </div>
  </header>

<!-- Page Content -->
<div class="container-fluid" style="margin-left:auto; margin-right:auto; width:75%">
  <div class="row justify-content-md-center">
    <div class="col-md-4 mb-5">
      <div class="card h-100">
        <svg class="card-img-top" width="20em" height="20em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
          <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
          <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
          <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
        </svg>
        <div class="card-body">
          <h4 class="card-title">View/Edit Profile</h4>
          <p class="card-text">You can update your personal profile information and preferences for roommates</p>
        </div>
        <div class="card-footer">
          <a href="my_profile.php" class="btn btn-info">My Profile</a>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-5">
      <div class="card h-100">
    <svg class="card-img-top" width="20em" height="20em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
  </svg>
        <div class="card-body">
          <h4 class="card-title">Browse Roommates</h4>
          <p class="card-text">You can browse roommates and make a request to be match with them</p>
        </div>
        <div class="card-footer">
          <a href="browse.php" class="btn btn-info">Find Roommate</a>
        </div> 
      </div>
    </div>
    <div class="col-md-4 mb-5">
      <div class="card h-80">
        <svg class="card-img-top" width="20em" height="20em" viewBox="0 0 16 16" class="bi bi-question-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033a.237.237 0 0 1-.24-.247C5.35 4.091 6.737 3.5 8.005 3.5c1.396 0 2.672.73 2.672 2.24 0 1.08-.635 1.594-1.244 2.057-.737.559-1.01.768-1.01 1.486v.105a.25.25 0 0 1-.25.25h-.81a.25.25 0 0 1-.25-.246l-.004-.217c-.038-.927.495-1.498 1.168-1.987.59-.444.965-.736.965-1.371 0-.825-.628-1.168-1.314-1.168-.803 0-1.253.478-1.342 1.134-.018.137-.128.25-.266.25h-.825zm2.325 6.443c-.584 0-1.009-.394-1.009-.927 0-.552.425-.94 1.01-.94.609 0 1.028.388 1.028.94 0 .533-.42.927-1.029.927z"/>
  </svg>
        <div class="card-body">
          <h4 class="card-title">Create/Manage Requests</h4>
          <p class="card-text">You can create roommate requests, see all the requests and decide for your roommate</p>
        </div>
        <div class="card-footer">
          <a href="my_requests.php" class="btn btn-info">Manage Requests</a>
        </div>
      </div>
    </div>
  </div>
<!-- /.row -->

<div class="row">
  <div class="col-md-8 mb-5">
    <h2>What We Do</h2>
    <hr>
    <p>As a student traveling abroad sometimes it can be hard to find your roommate, we are helping to make this process flawless for you.</p>
    <p>Based on your survey entries we will match with you best possible roommate.</p>
    <a class="btn btn-info btn-lg" href="#">Take/Update Your Survey &raquo;</a>
  </div>
  <div class="col-md-4 mb-5">
    <h2>Contact Us</h2>
    <hr>
    <address>
      <strong>Faculty Coordinator</strong>
      <br>601 S College Rd 
      <br>Wilmington, NC 28403
      <br>
    </address>
    <address>
      <abbr title="Phone"></abbr>
      (910) 000-0000
      <br>
      <abbr title="Email"></abbr>
      <a href="mailto:#">support@email.com</a>
    </address>
  </div>
  <label id="test">TEST</label>
</div>
<!-- /.row -->
</div>

<!-- /.container -->

  <!-- Footer -->
		<?php include "includes/footer.php"; 
			?>
    <!-- /.container -->
    <script>
  var url = document.getElementById("test").innerHTML = window.location.href;
  if(url.includes("updated=true"))
  {
    document.getElementById("test").style.display = "block";
  }
  else
  {
    document.getElementById("test").style.display = "none";
  }
</script>
</body>
</html>