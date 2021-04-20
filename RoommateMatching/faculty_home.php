<?php require "includes/config.php";
    session_start();

    $dbc = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);

	$current_user = $_SESSION["userid"];
    //$current_user = 2;
    $query = "SELECT *
             FROM student
             WHERE user_id != $current_user AND has_assignment=0";

    $result = mysqli_query($dbc, $query);

    //Fetch all rows of result as an associative array
    if($result){
        while($row = $students = mysqli_fetch_array($result)){
            $studentArray[] = array(
                'id' => $row['user_id'],
                'name' => $row['first_name'] . ' ' . $row['last_name'],
                'email' => $row['email'],
                'smoker' => $row['is_smoker']
            );
        }

    }
    else {
        echo "<h2>You have reached this page in error</h2>";
        mysqli_close($dbc);
        exit;
    }
    ?>
<!doctype html>
<html lange="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Faculty | Home</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">

  <!-- Main stylesheet -->
	<link rel="stylesheet" href="css/main.css">

  <!-- Add custom styles for this page here -->

</head>

<body>
  <!-- Navigation -->
	<?php 
		include "includes/faculty_nav.php";
	?>
	
  <!-- Header -->
  <header class="bg-info py-5 mb-5">
    <div class="container h-50" style="max-height:10%">
      <div class="row h-50 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">
			  Faculty Dashboard</h1>
          <p class="lead mb-5 text-white-50"></p>
        </div>
      </div>
    </div>
  </header>

<!-- Page Content -->
<div class="container-fluid" style="margin-left:auto; margin-right:auto; width:75%">
  <div class="row justify-content-md-center">
    <div class="col-md-4 mb-5">
        <table>
            <tr>
                <td>Unmatched Students</td>
                <td>
                    <?php echo count($studentArray);
                        ?>
                </td>
            </tr>
</table>
      <!-- <div class="card h-80">
        <svg class="card-img-top" width="20em" height="20em" viewBox="0 0 16 16" class="bi bi-question-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033a.237.237 0 0 1-.24-.247C5.35 4.091 6.737 3.5 8.005 3.5c1.396 0 2.672.73 2.672 2.24 0 1.08-.635 1.594-1.244 2.057-.737.559-1.01.768-1.01 1.486v.105a.25.25 0 0 1-.25.25h-.81a.25.25 0 0 1-.25-.246l-.004-.217c-.038-.927.495-1.498 1.168-1.987.59-.444.965-.736.965-1.371 0-.825-.628-1.168-1.314-1.168-.803 0-1.253.478-1.342 1.134-.018.137-.128.25-.266.25h-.825zm2.325 6.443c-.584 0-1.009-.394-1.009-.927 0-.552.425-.94 1.01-.94.609 0 1.028.388 1.028.94 0 .533-.42.927-1.029.927z"/>
        </svg>
        <div class="card-body">
          <h4 class="card-title">Manage Students</h4>
          <p class="card-text">You can manage requests, and view unassigned students</p>
        </div>
        <div class="card-footer">
          <a href="my_requests.php" class="btn btn-info">Manage Requests</a>
        </div>
      </div> -->
    </div>
  </div>
<!-- /.row -->
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