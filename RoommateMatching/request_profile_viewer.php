<?php require "includes/config.php";
session_start();

$dbc = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);

$view = $_POST["view"];
$request = $_POST["request"];
$current_user = $_POST["id"];
$to_student_id = $_POST["student_id"];
$notes = $_POST["notes"];
$userid = $_SESSION["userid"];

$info_query = "SELECT user_id
                 FROM student
                 WHERE student_id = '$current_user';";

$info_result = mysqli_query($dbc, $info_query);

$info_split = mysqli_fetch_row($info_result);

$viewer= $info_split[0];


if ($view){

  $_SESSION["transferid"] = $viewer;
  header("Location: ../public/view_profile.php");
  exit();
}

 else {

   $request_insert = "INSERT INTO request(from_student_id,to_student_id,note)
                      VALUES($from_student_id,$to_student_id,'$notes');";

   $request_result = mysqli_query($dbc, $request_insert);

   header("Location: ../public/browse.php");
   exit();


 }


?>
