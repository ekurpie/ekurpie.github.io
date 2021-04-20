<?php require 'config.php';
	session_start();
	$userid = $_SESSION['userid'];

	//$id = $_POST['id'];
	$firstName = $_POST['first'];
	$middleInitial = $_POST['middle'];
	$lastName = $_POST['last'];
	$gender = $_POST['gender'];
	$smoker = $_POST['smoker'];
	$wake = $_POST['wake'];
	$bedtime = $_POST['bedtime'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$notes = $_POST['notes'];
	//$password = $_POST['password'];

	// $Update_Query = "UPDATE student
	// 				 SET first_name = '$firstName',
	// 				 middle_initial = '$middleInitial',
	// 				 last_name = '$lastName',
	// 				 email = '$email',
	// 				 phone_number = '$phone',
	// 				 is_early_riser = '$wake'
	// 				 WHERE user_id = $userid";
	$Update_Query = "UPDATE student
		SET first_name = '$firstName',
		middle_initial = '$middleInitial',
		last_name = '$lastName',
		email = '$email',
		phone_number = '$phone',
		is_early_riser = '$wake',
		is_night_owl = '$bedtime',
		is_smoker = '$smoker',
		notes = '$notes'
		WHERE user_id = $userid";
//$DB_CONN = new mysqli($HOST, $USERNAME, $PASSWORD, $DB_NAME);
	if(mysqli_query($DB_CONN, $Update_Query)){
		header('Location:../my_profile.php?updated=true');
	}
	else{
		header('Location:../my_profile.php?updated=false');
	}

?>