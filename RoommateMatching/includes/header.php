<?php
	session_start();
	
	if (!$_SESSION["authenticated"]){
		header("Location: http://localhost/public_html/RoommateMatching/index.php");
	}
?>