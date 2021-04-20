<?php require "includes/config.php";
  session_start();
  $dbc = mysqli_connect($HOST,$USERNAME,$PASSWORD,$DB_NAME);

  $studentID = $_SESSION["userid"];

  $Query_for_update = "SELECT *
                FROM student
                WHERE user_id = $studentID";

  $Update_Results = mysqli_query($dbc, $Query_for_update);
  $Info = mysqli_fetch_row($Update_Results);

  $first = $Info[2];
  $middle = $Info[3];
  $last = $Info[4];
  $gender = $Info[5];
  $wake = $Info[6];
  $bedtime = $Info[7];
  $smoker = $Info[8];
  $roommateinfo = $Info[9];
  $phone = $Info[14];
  $email = $Info[13];

  $Query_for_bannerID = "SELECT banner_id, password
                FROM rm_user
                WHERE user_id = '$studentID';";

  $banner_results = mysqli_query($dbc, $Query_for_bannerID);
  $banner_selection = mysqli_fetch_row($banner_results);

  $password = $banner_selection[1];
  $displayid = $banner_selection[0];

  if (empty($banner_selection[0])) {
    $displayid = $_SESSION["userid"];
  }
	?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Roommate Matching</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">

  <!-- Custom styles for this template -->
  <link href="../css/business-frontpage.css" rel="stylesheet">
  <link href="css/main.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <?php include "includes/student_nav.php"; 
  ?>

  <!-- Header -->
  <header class="bg-info py-5 mb-5">
    <div class="container h-50" style="max-height:10%">
      <div class="row h-50 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">
			  E D I T I N G:
			  <?php echo " ".$first?>'s Profile</h1>
        </div>
      </div>
    </div>
  </header>

<body>
	<form name = "registration"  method="post" action="includes/save_student.php" style="margin-left:auto; margin-right:auto;width:70%">
      <script type="text/javascript" src="../js/functions.js"></script>
		<div class="form-row">
    <div class="form-group col-md-5">
      <label for="first">First Name</label>
      <input type="text" class="form-control" name = "first" id="first" value="<?php echo $first?>">
    </div>
	  <div class="form-group col-md-2">
      <label for="middle">Middle Initial</label>
      <input type="text" class="form-control" name = "middle" id="middle" value="<?php echo $middle?>">
    </div>
    <div class="form-group col-md-5">
      <label for="last">Last Name</label>
      <input type="text" class="form-control" name = "last" id="last"  value="<?php echo $last?>">
    </div>
  </div>
  <div class="form-row">
	<div class="form-group col-md-6">
      <label for="email">Email:</label>
		<input class="form-control" type="text" name="email" value="<?php echo $email?>">
		</div>
	<div class="form-group col-md-6">
      <label for="password">Password:</label>
		<input class="form-control" type="password" name="password" value="<?php echo $password?>">
		</div>
	</div>
	<div class="form-row">
	<div class="form-group col-md-6">
      <label for="phone">Phone:</label>
		<input class="form-control" type="text" name="phone" value="<?php echo $phone?>">
	</div>
	<div class="form-group col-md-6">
      <label for="banner">BannerID:</label>
		<input class="form-control" type="text" name="id" value="<?php echo $displayid?>" readonly>
	</div>
	</div>
	<div class="form-row">
    <div class="form-group col-md-3">
      <label for="gender"> Gender?:</label>
          <select name="gender" id = "gender" class="form-control" >
            <option value= "Male">Male</option>
            <option value= "Female">Female</option>
          </select>
    </div>
	<div class="form-group col-md-3">
	<label for="wake" > Eary Riser?:</label>
          <select name="wake" id = "wake" class="form-control" >
            <option value= "1">Yes</option>
            <option value= "0">No</option>
          </select>
    </div>
	<div class="form-group col-md-3">
	<label for="bedtime"> Night Owl?:</label>
          <select name="bedtime" id = "bedtime" class="form-control">
            <option value= "1">Yes</option>
            <option value= "0">No</option>
          </select>
    </div>
	<div class="form-group col-md-3">
	<label for="smoker" > Smoker?:</label>
          <select name="smoker" id = "smoker" class="form-control">
            <option value= "1">Yes</option>
            <option value= "0">No</option>
          </select>
    </div>
	</div>
	<div class="form-row">
    <div class="form-group col-md-12">
      <label for="roommate"> What are you looking for in a roommate?:</label>
	  <textarea class="form-control" type="textarea" name="notes" value="<?php echo $roommateinfo?>"><?php echo $roommateinfo?></textarea>
	</div>
	</div>

  <button type="submit" class="btn btn-info" onclick="checkfields(this.form)">SAVE</button>
</form>

      <script type="text/javascript">
      var smokerjs = "<?php echo $smoker ?>";
      var wakejs = "<?php echo $wake ?>";
      var bedtimejs = "<?php echo $bedtime?>";
      var genderjs = "<?php echo $gender?>";


      var elementsmoker = document.getElementById("smoker");
      var elementgender = document.getElementById("gender");
      var elementbedtime = document.getElementById("bedtime");
      var elementwake = document.getElementById("wake");

      elementsmoker.value = smokerjs;
      elementgender.value = genderjs;
      elementbedtime.value = bedtimejs;
      elementwake.value = wakejs;

      </script>
</body>
</html>