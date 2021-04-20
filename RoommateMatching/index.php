<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<meta name="description" content="">
	  <meta name="author" content="">
	  
	<title>Login | Roommate Matching</title>

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
<!-- /Navigation -->

<!-- Header -->
<header class="bg-info py-5 mb-5">
	<div class="container h-50" style="max-height:10%">
		<div class="row h-50 align-items-center">
			<div class="col-lg-12">
          		<h1 class="display-4 text-white mt-5 mb-2">
					W E L C O M E to Roommate Matching!</h1>
				<p class="lead mb-5 text-white-50">
					Sign in now to manage your profile information and find your roommate.</p>
			</div>
		</div>
	</div>
</header>
<!-- /Header -->

<!-- Page Content -->
<div class="container-fluid" style="margin-left:auto; margin-right:auto; width:100%;">
	<div class="row justify-content-md-center">
		<div class="col-sm-6">
			<div class="panel-group" style="width:100%;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>Student/Faculty Login</h4>
					</div>
					<div class="panel-body">
						<form name="Login" method=post action="includes/authenticate.php">
							<label for="bannerid">BannerID</label><br>
							<input type="text" id="bannerid" name="bannerid" placeholder="850xxxxxx" required/><br>
							<label for="password">Password</label><br>
							<input type="password" id="password" name="password" placeholder="*********" required/><br>
							<input type="submit" value="Login"/>
							<input type="reset" value="Cancel"/>
						</form>
						<h4>*New users: please enter your 850 number with no password and click login to register*</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
<?php include "includes/footer.php"; 
	?>
<!-- /Footer -->
</div>
<!-- /Page Content -->


</body>
</html>
