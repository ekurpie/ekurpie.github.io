<?php require "includes/config.php";
	session_start();

    $dbc = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);

		$userID = $_SESSION["userid"];

		$info_query = "SELECT Gender,student_id
		 								 FROM student
										 WHERE user_id = $userID;";

		$info_result = mysqli_query($dbc, $info_query);

		$info_split = mysqli_fetch_row($info_result);



		$studentID = $info_split[1];

    $query = "SELECT *
             FROM student
						 LEFT JOIN request ON 'student.user_id' = 'request.from_student_id'
             WHERE user_id != $userID and gender = '$info_split[0]' and has_assignment = 0 and student_id NOT IN (SELECT to_student_id
						 																																																					FROM request
																																																											WHERE from_student_id = '$studentID')";

    $result = mysqli_query($dbc, $query);

    //Fetch all rows of result as an associative array
    if($result){
        while($row = $students = mysqli_fetch_array($result)){
            $studentArray[] = array(
                'id' => $row['user_id'],
								'student_id' => $row['student_id'],
                'name' => $row['first_name'] . ' ' . $row['last_name'],
                'email' => $row['email'],
                'smoker' => $row['is_smoker'],
                'is_early_riser' => $row['is_early_riser']
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
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Roommate Matching</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">

  <!-- Main stylesheet -->
  <link rel="stylesheet" href="css/main.css">

  <!-- Add custom styles for this page here -->

</head>

<body>
<!-- Navigation -->
<?php include "includes/student_nav.php";
  ?>
<!-- /Navigation -->

<!-- Header -->
<header class="bg-info py-5 mb-5">
	<div class="container h-50" style="max-height:10%">
		<div class="row h-50 align-items-center">
			<div class="col-lg-12">
          		<h1 class="display-4 text-white mt-5 mb-2">
					B R O W S E</h1>
				<p class="lead mb-5 text-white-50">
					Find your roommate today.</p>
			</div>
		</div>
	</div>
</header>
<!-- /Header -->

<!-- Page Content -->
<script>
function browse_submit(form){
		form.submit(form);
}
var OpenSubX = (screen.width/2)-275;
var OpenSubY = (screen.height/2)-150;
var pos = "left="+OpenSubX+",top="+OpenSubY;

function request_submit(form){

					var	popup = window.open("submit_request.php","Request Notes","width=800,height=250,scrollbars=yes" + pos );
					popup.onbeforeunload = function(){
						form.submit();
					}
				}
</script>
<div class="container-fluid" style="margin-left:auto; margin-right:auto; width:100%;">
	<div class="row justify-content-md-center">
		<div class="col-sm-6">
            <?php
                $i = 0;
                foreach($studentArray as $s){
									// $_SESSION["id_" . $i] = $s['id'];
									// echo $_SESSION["id_" . $i];
									echo
                    '<div class="panel-group" id="student'.$s['id'].'">
										<form method= "post" action ="request_view_redirector.php">
										<input type ="hidden" name="id" value = '.$s['id'].'>
										<input type ="hidden" name="student_id" value = '.$s['student_id'].'>
										<input type ="hidden" name="main_id" value = '.$studentID.'>
										<input type ="hidden" name="request" value = "request" id = "request">
										<input type ="hidden" name="notes" value = "notes" id = "notes">
                        <div class="panel panel-default>
                        <div class="panel-heading">
                        <table>
                            <td width="100%"><h4>'.$s['name'].'</h4></td>
                            <td><button value = "view" name = "view" id = "view" onclick = "browse_submit(this.form)">Profile</button></td>
                            <td><button type = "button" onclick = "request_submit(this.form)">Request</button></td>
                            </table
                        </div>
                        <div class="panel-body">
                            <p>'.$s['email'].'</p>

                        </div>
										</form>
                    </div>';
                    $i++;
                }
            ?>
		</div>
	</div>
</div>
<!-- /Page Content -->

<!-- Footer -->

<!-- /Footer -->
</body>

</html>
