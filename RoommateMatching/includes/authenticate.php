<?php require "config.php";

	session_start();

	$input_userid = $_POST["bannerid"];
	$input_password = md5($_POST["password"]);

	// Try and connect using config settings
	$DB_CONN = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);

	if ( mysqli_connect_errno() ) {
		// Stop the script and display the error if unable to connect
		exit('Failed to connect to MySQL: ' . mysqli_connect_error());
	}
	
	ini_set("error_reporting", "true");
	error_reporting(E_ALL|E_STRICT);
	
	$qry_user = "SELECT user_id,
								password,
								role_id
					   FROM rm_user
					   WHERE banner_id = $input_userid";

	$user_result = mysqli_query($DB_CONN, $qry_user);

	$user_result_array = mysqli_fetch_array($user_result);

	// Check to make sure user exists
	if(empty($user_result_array)){
		// User not in database, redirect to registration	
		$_SESSION["userid"] = $input_userid;
		header("Location: ../register.php");
	}
	else{
		$qry_password = $user_result_array[1];
		
		if($qry_password == $input_password){
			$_SESSION["userid"] = $user_result_array[0];
			$_SESSION["role"] = $user_result_array[2];
			$_SESSION["authenticated"] = true;
			
			if($_SESSION["role"] == 2)
			{
				header("Location: ../faculty_home.php");	
			}
			else{
					$query = "SELECT student_id
							 FROM student
							 WHERE user_id = '$user_result_array[0]'";

					$studentResult = mysqli_query($dbc, $query);

					//Fetch all rows of result as an associative array
					if($studentResult){
						$_SESSION['studentid'] = mysqli_fetch_row($result);
					}
				
			header("Location: ../student_home.php");


			}	
		}
		else{
			header("Location: ../index.php?error=WrongPassword");
			exit();
		}
	}
?>