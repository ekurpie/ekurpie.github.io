<?php include "includes/config.php";
    session_start();

    $dbc = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);

    $current_user = $_SESSION["userid"];

    $sql = "SELECT *
            FROM student";

    $result = mysqli_query($dbc, $sql);

    if($result){
        while($row = $matches = mysqli_fetch_array($result)){
            if('has_assignment' == 0){
                $unmatchedStudents[] = array(
                    'id' => $row['user_id'],
                    'name' => $row['first_name'].' '.$row['last_name'],
                    'smoker' => $row['is_smoker'],
                    'earlybird' => $row['is_early_riser'],
                    'nightowl' => $row['is_night_owl'],
                    'notes' => $row['notes'],
                    'pic' => $row['image_path'],
                    'email' => $row['email']
                );
            }
            else{
                $matchedStudents[] = array(
                    'id' => $row['user_id'],
                    'first_name' => $row['first_name']
                );
            }
        }
    }

    function boolToString(int $input){
        if($input == 0){
            return '<i class="fas fa-times" style="color:red;"></i>';
        }
        else{
            return '<i class="fas fa-check" style="color:green;"></i>';
        }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
  <title>Faculty Coordinator</title>
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!-- Main stylesheet -->
  <link rel="stylesheet" href="css/main.css">

    <!-- Fontawesome Icons -->
    <link rel="stylesheet" href="lib/fontawesome/webfonts/all.css">

  <!-- Add custom styles for this page here -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        Faculty Coordinator</h1>
          <p class="lead mb-5 text-white-50">Manage paired and unpaired students.</p>
        </div>
      </div>
    </div>
  </header>
  <div class="container">
  <div id="profileModal" class="modal">
            <!-- Delete Modal content -->
            <div class="modal-content" style="width:35%; min-width:400px;">
                <span class="close">&times;</span>
                <h3 id="viewStudentHeader" style="text-align:center; padding-bottom:5px;border-bottom:1px solid gainsboro"></h3>
            <form method="POST" action="" enctype="multipart/form-data" style="margin-top:10%;">
                    <label id="viewStudentName"></label>
                    <div class="container" style="width:50%">
                    <div class="row">
                        <div class="col-sm-6">
                            <button type="submit" name="confirm" class="btn btn-success" style="width:75%;margin-top:5%;">Yes</button>
                            </div>
                        <div class="col-sm-6">
                        <button type="cancel" name="cancel" class="btn btn-danger" style="width:75%;margin-top:5%;">No</button>
                        </div>
                    </div>
                    </div>
            </form>
            </div>
        </div>
  <ul class="nav nav-tabs nav-centered">
    <li class="active" style="width:50%"><a data-toggle="tab" href="#unmatched">
            <p>Unmatched Students
                <?php 
                    if(isset($unmatchedStudents)){
                        echo "(".count($unmatchedStudents).")";

                    }
                    else{
                        echo "(0)";
                    }
        ?>
            </p>
        </a>
    </li>
    <li style="width:50%"><a data-toggle="tab" href="#matched">
                <p>Matched Students
                <?php 
                    if(isset($matchedStudents)){
                        echo "(".count($matchedStudents).")";

                    }
                    else{
                        echo "(0)";
                    }
        ?>
            </p>
    </a></li>
  </ul>
  <!-- SENT -->
  <div class="tab-content">
    <div id="unmatched" class="tab-pane fade in active">
      <p> </p>
      <table class="table">
        <thead>
          <tr>
          <th></th>
            <th>Name</th>
            <th>Smoker</th>
            <th>Early Bird</th>
            <th>Night Owl</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
            <?php 
                $i = 0;
                if(isset($unmatchedStudents)){
                    foreach($unmatchedStudents as $s){
                    $uid = $s['id'];
                        echo 
                        '<tr id="student'.$s['id'].'">
                            <td><div style="overflow:hidden;height:100px;width:100px;"> <img src="'.$s['pic'].'"/></div></td>
                            <td id="name_'.$uid.'">'.$s['name'].'</td>
                            <td style="text-align:left;">'.boolToString($s['smoker']).'</td>
                            <td>'.boolToString($s['earlybird']).'</td>
                            <td>'.boolToString($s['nightowl']).'</td>
                            <td>
                             
                                <button id="viewStudentButton_'.$s['id'].'" type="button" class="btn btn-info" onclick="viewStudent(this.id)" style="width: auto;">View Student</button>
                            </td>
                        </tr>';
                        $i++;
                    } 
                }
                else{
                    echo "<tr><td>There are no unmatched students to display.</td></tr>";
                }
                ?>
        </tbody>
      </table>
    </div>
    <!-- RECEIVED -->
    <div id="matched" class="tab-pane fade">
      <p> </p>
      <table class="table">
        <thead>
          <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Smoker?</th>
            <th>Early Riser?</th>
            <th>Night Owl?</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
            <?php 
                $i = 0;
        
                if(isset($matchedStudents)){
                    foreach($matchedStudents as $s){
                    $uid = $s['id'];
                        echo 
                        '<tr id="student'.$s['id'].'">
                            <td id="first_name".$uid">'.$s['first_name'].'</td>
                            <td>
                                <button type="button" class="btn btn-info" style="width: auto;">View Profile</button>
                                <button id="sentDeleteButton_'.$s['id'].'" type="button" class="btn btn-danger" onclick="deletePopup(this.id)" style="width: auto;">Delete</button>
                            </td>
                        </tr>';
                        $i++;
                    } 
                }
                else{
                    echo "<tr><td>There are no matched students to display.</td></tr>";
                }
                ?>
        </tbody>
      </table>
    </div>
  </div>
  </div>
<script>
var modal = document.getElementById("profileModal");

var span = document.getElementsByClassName("close")[0];

span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function viewStudent(clickedID){
    modal.style.display = "block";
    var studentID = clickedID.split("_")[1];
    var studentName = document.getElementById("name_2").textContent;
    document.getElementById('viewStudentHeader').innerHTML = studentName;
    document.getElementById('viewStudentName').innerHTML = studentName;
}

</script>
   <!-- Footer -->
  <?php include "includes/footer.php"
  ?>
</body>
</html>