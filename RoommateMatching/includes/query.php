<?php require "config.php";
	//$current_user = $_SESSION["userid"];
	$current_user = 2;

	$qry_student_detail = "SELECT first_name,
							   middle_initial,
							   last_name,
							   gender,
							   email,
							   is_early_riser,
							   is_night_owl,
							   is_smoker,
							   notes,
							   has_assignment,
							   phone_number
						FROM student
						WHERE user_id = $current_user";

	$result_student_detail = mysqli_query($DB_CONN, $qry_student_detail);
	
	if($result_student_detail){
		$student = mysqli_fetch_row($result_student_detail);
		mysqli_close($DB_CONN);
	}
else {
		echo "<h1>$current_user</h1>";
        echo "<h2>You have reached this page in error</h2>";
        mysqli_close($DB_CONN);
        exit;
    }
?>