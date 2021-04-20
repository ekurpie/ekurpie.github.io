<?php require "includes/config.php";
	session_start();

    $dbc = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);
    //or die('Error connecting to MySQL server.');




	$current_user = $_SESSION["transferid"];


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
			  Viewing <?php echo "" . $first . " " . $last ."'s Profile"?></h1>

        </div>
      </div>
    </div>
  </header>

  <div>
		<form style="margin-left:auto; margin-right:auto;width:70%">
 <input type="button" value="Back" onclick="history.back()">
</form>


    	<table class="table" style="margin-left:auto; margin-right:auto;width:70%">

		<tr>

			<th>First Name: </th>

            <td><?php echo " ".$first?></td>
		</tr>
		<tr>
			<th>Middle Initial: </th>
            <td><?php echo " ".$middle?></td>
		</tr>
        <tr>
			<th>Last Name: </th>
            <td><?php echo " ".$last?></td>
		</tr>
	    <tr>
			<th>BannerID: </th>
            <td><?php echo " ".$displayid?></td>
		</tr>
        <tr>
			<th>UNCW Email: </th>
            <td><?php echo " ".$email?></td>
		</tr>
        <tr>
			<th>Phone: </th>
            <td><?php echo " ".$phone?></td>
		</tr>
		<tr>
			<th>Gender: </th>
            <td><?php echo " ".$gender?></td>
		</tr>
        <tr>
			<th>Do you typically wake up early in the morning?: </th>
            <td>
                <?php
                    if($wake == 0) echo "No";
                    else echo "Yes";
                ?>
            </td>
		</tr>
		<tr>
			<th>Do you typically go to bed late at night?: </th>
            <td>
                <?php
                    if($bedtime==0) echo "No";
                    else echo "Yes";
                ?>
            </td>
		</tr>
 		<tr>
			<th>Are you a smoker?: </th>
            <td>
                <?php
                    if($smoker==0) echo "No";
                    else echo "Yes";
                ?>
            </td>
		</tr>
		<tr>
			<th>What are you looking for in a roommate?: </th>
            <td><?php echo " ".$roommateinfo?></td>
		</tr>
		<tr>
			<th>Matching Status: </th>
			<td>
                <?php
                    if($matchstatus==0) echo "Unmatched";
                    else echo "MATCHED : Need to add roommate assignment here";
                ?>
            </td>
		</tr>
	</table>
    </div>
	 <!-- Footer -->
  <?php include "includes/footer.php"
  ?>

</body>
</html>
