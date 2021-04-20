<?php require '../config.php';
	session_start();

	$userid = $_SESSION['userid'];
    $requestID = $_POST['requestID_input'];

	if (isset($userid)){	
		$sql = "UPDATE request
				SET status_id = 2
				WHERE request_id = $requestID";
					
		$result = mysqli_query($DB_CONN, $sql);
					
		header("Location: ../../my_requests.php?requestDeleted");
	}
	else{
		echo "Unable to delete request.";
	}
?>