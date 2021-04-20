<?php require "includes/config.php";
	session_start();

    $dbc = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);
    //or die('Error connecting to MySQL server.');

	$current_user = $_SESSION["userid"];
	//$current_user = 2;
    $query = "SELECT *
             FROM student
             WHERE user_id = '$current_user';";

    $result = mysqli_query($dbc, $query);

    //Fetch all rows of result as an associative array
    if($result){
        $student = mysqli_fetch_row($result);
        
    }
    else {
        echo "<h2>You have reached this page in error</h2>";
        mysqli_close($dbc);
        exit;
    }
$profileImg = $student[10];
$first = $student[2];
$middle = $student[3];
$last = $student[4];
$gender = $student[5];
$wake = $student[6];
$bedtime = $student[7];
$smoker = $student[8];
$roommateinfo = $student[9];
$matchstatus = $student[12];
$phone = $student[14];
$email = $student[13];
$_SESSION['studentid'] = $student[0];

$Query_for_bannerID = "SELECT banner_id
               FROM rm_user
               WHERE user_id = '$current_user';";

$banner_results = mysqli_query($dbc, $Query_for_bannerID);
$banner_selection = mysqli_fetch_row($banner_results);

$displayid = $banner_selection[0];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

  <title>My Profile</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">

  <!-- Fontawesome Icons -->
  <link rel="stylesheet" href="lib/fontawesome/webfonts/all.css">
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
			  W E L C O M E, <?php echo "" . $first?></h1>
          <p class="lead mb-5 text-white-50">Here is your current profile information.</p>
			            <a href="edit_profile.php" class="btn btn-light">Edit Profile</a>

        </div>
      </div>
    </div>
  </header>

  <div class="container">
    <div class="row">
        <div class="col-sm-6">
            <div class="container" name="profileImage">
                <?php 
                    if(!is_null($profileImg)){
                        echo '<img src="'.$profileImg.'"/>';
                    }
                    else
                    {
                        echo '<img src="data/uploads/profile_default.png/>';
                    }
                    ?>
                <button id="profileImageButton" title="Update Profile Picture">
                    <span style="position:relative; top:50%; left:-2px;">
                    <i class="fas fa-camera" style="line-height:inherit;"></i>
                </span>
                </button>
            </div>
        </div>
        <!-- The Modal -->
        <div id="imageModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <h3 style="text-align:center; padding-bottom:5px;border-bottom:1px solid gainsboro">Update Your Profile Picture</h3>
            <form method="POST" action="includes/save_image.php" enctype="multipart/form-data" style="margin-top:10%;">
                <input type="file" name="file">
                    <button type="submit" name="submit" style="width:75%;margin-top:5%;">Upload</button>
            </form>
            </div>
        </div>
        <div class="col-sm-6"> 
        <h2>
            <?php echo " " . $first . " " . $last ?>
        </h2>
    	<table class="table" style="width:70%">
        <tr>
            <td>
                    <b>Early Bird</b>
            </td>
            <td>
            <?php
                    if($wake==0) echo '<i class="fas fa-times" style="color:red;"></i>';
                    else echo '<i class="fas fa-check" style="color:green;"></i>';
                ?>
            </td>
		</tr>
		<tr>
			<td>
                    <b>Night Owl</b>
            </td>
            <td>
                <?php
                    if($bedtime==0) echo '<i class="fas fa-times" style="color:red;"></i>';
                    else echo '<i class="fas fa-check" style="color:green;"></i>';
                ?>
            </td>
		</tr>
 		<tr>
			<td>
                    <b>Smoker</b>
            </td>
            <td>
            <?php
                    if($smoker==0) echo '<i class="fas fa-times" style="color:red;"></i>';
                    else echo '<i class="fas fa-check" style="color:green;"></i>';
                ?>
            </td>
		</tr>
		<tr>
            <td>
                    <b>Matched</b>
            </td>
			<td>
                <?php
                    if($matchstatus==0) echo '<i class="fas fa-times" style="color:red;"></i>';
                    else echo '<i class="fas fa-check" style="color:green;"></i>';
                ?>
            </td>
        </tr>
        <tr>
			<td><b>My ideal roommate:</b>
            </td>
            <td>
                <?php echo " ".$roommateinfo?>
            </td>
		</tr>
    </table>
    <button type="reset" style="background:gray;" disabled>Request <em>Testing Only</em></button>
    </div>
    </div>
    </div>
	 <!-- Footer -->
  <?php include "includes/footer.php"
  ?>
  <script>
// Get the modal
var modal = document.getElementById("imageModal");

// Get the button that opens the modal
var btn = document.getElementById("profileImageButton");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>