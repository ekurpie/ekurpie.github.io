<?php include "includes/config.php";
    session_start();

    $dbc = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);

    $current_user = $_SESSION["userid"];
    //$current_student = $_SESSION['studentid'];
    $current_student = 1;
    
    $rcvdSQL = "SELECT request.*,
                   student.*
			FROM request
            RIGHT JOIN student ON student.student_id = request.from_student_id
            WHERE to_student_id = '$current_student'
            AND status_id != 2
            AND status_id != 3";

    $sentSQL = "SELECT request.*,
            student.*
            FROM request
            RIGHT JOIN student ON student.student_id = request.to_student_id
            WHERE from_student_id = '$current_student'
            AND status_id != 2
            AND status_id != 3";

    $rcvdResult = mysqli_query($dbc, $rcvdSQL);

    if($rcvdResult){
        while($row = $requests = mysqli_fetch_array($rcvdResult)){
                $rcvdRequests[] = array(
                    'id' => $row['request_id'],
                    'status' => $row['status_id'],
                    'active' => $row['active'],
                    'note' => $row['note'],
                    'created' => $row['created_date'],
                    'updated' => $row['last_updated'],
                    'name' => $row['first_name'].' '.$row['last_name'],
                    'smoker' => $row['is_smoker'],
                    'earlybird' => $row['is_early_riser'],
                    'nightowl' => $row['is_night_owl'],
                    'notes' => $row['notes'],
                    'pic' => $row['image_path'],
                    'email' => $row['email']
                );
            }   
        }

        $sentResult = mysqli_query($dbc, $sentSQL);

        if($sentResult){
            while($row = $requests = mysqli_fetch_array($sentResult)){
                    $sentRequests[] = array(
                        'id' => $row['request_id'],
                        'status' => $row['status_id'],
                        'active' => $row['active'],
                        'note' => $row['note'],
                        'created' => $row['created_date'],
                        'updated' => $row['last_updated'],
                        'name' => $row['first_name'].' '.$row['last_name'],
                        'smoker' => $row['is_smoker'],
                        'earlybird' => $row['is_early_riser'],
                        'nightowl' => $row['is_night_owl'],
                        'notes' => $row['notes'],
                        'pic' => $row['image_path'],
                        'email' => $row['email']
                    );
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

  <title>My Requests</title>

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
			  M A N A G E  Requests</h1>
          <p class="lead mb-5 text-white-50">Manage your sent and received roommate requests!.</p>
        </div>
      </div>
    </div>
  </header>
  <div class="container">
          <div id="confirmationModal" class="modal">
            <!-- Delete Modal content -->
            <div class="modal-content" style="width:35%; min-width:400px;">
                <span class="close">&times;</span>
                <h3 style="text-align:center; padding-bottom:5px;border-bottom:1px solid gainsboro">Delete this request?</h3>
            <form method="POST" action="includes/queries/delete_request.php" enctype="multipart/form-data" style="margin-top:10%;">
                    <input id="requestID_input" name="requestID_input" type="text" style="display:none;"></input>
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
        <div id="acceptModal" class="modal">
            <!-- Delete Modal content -->
            <div class="modal-content" style="width:35%; min-width:400px;">
                <span class="close">&times;</span>
                <h3 style="text-align:center; padding-bottom:5px;border-bottom:1px solid gainsboro">Accept this request?</h3>
            <form method="POST" action="includes/queries/accept_request.php" enctype="multipart/form-data" style="margin-top:10%;">
                    <input id="acceptRequestID_input" name="requestID_input" type="text" style="display:none;"></input>
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
    <li class="active" style="width:50%"><a data-toggle="tab" href="#sent">Sent Requests</a></li>
    <li style="width:50%"><a data-toggle="tab" href="#received">Received Requests</a></li>
  </ul>

  <!-- SENT -->
  <div class="tab-content">
      <div id="sent" class="tab-pane fade in active">
      <br>
      <p>These are my sent requests</p>
        <table class="table">
        <thead>
          <tr>
            <th sort="true">Name</th>
            <th>Smoker</th>
            <th>Early Bird</th>
            <th>Night Owl</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
            <?php 
                $i = 0;
                if(isset($sentRequests)){
                    foreach($sentRequests as $s){
                        echo 
                        '<tr id="request'.$s['id'].'">
                            <td>'.$s['name'].'</td>
                            <td style="text-align:left;">'.boolToString($s['smoker']).'</td>
                            <td>'.boolToString($s['earlybird']).'</td>
                            <td>'.boolToString($s['nightowl']).'</td>
                            <td>
                                <button type="button" class="btn btn-info" style="width: auto;">View Profile</button>
                                <button id="sentDeleteButton_'.$s['id'].'" type="button" class="btn btn-danger" onclick="deletePopup(this.id)" style="width: auto;">Delete</button>
                            </td>
                        </tr>';
                        $i++;
                    } 
                }
                else{
                    echo "<tr><td>You have no sent requests.</td></tr>";
                }
                ?>
        </tbody>
        </table>
        </div>

    <!-- RECEIVED -->
    <div id="received" class="tab-pane fade">
      <br>
      <p>These are my received requests</p>
        <table class="table">
        <thead>
          <tr>
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
            if(isset($rcvdRequests)){
                foreach($rcvdRequests as $s){
                    $smokes = $s['smoker'];
                    $earlybird = $s['earlybird'];
                    $nightowl = $s['earlybird'];

                    echo 
                    '<tr id="request'.$s['id'].'">
                        <td>'.$s['name'].'</td>
                        <td>'.boolToString($s['smoker']).'</td>
                        <td>'.boolToString($s['earlybird']).'</td>
                        <td>'.boolToString($s['nightowl']).'</td>
                        <td>
                            <button type="button" class="btn btn-info" style="width: auto;">View Profile</button>
                            <button id="rcvdAcceptButton_'.$s['id'].'" type="button" class="btn btn-success" onclick="acceptPopup(this.id)" style="width: auto;">Accept</button>
                            <button id="rcvdDeleteButton_'.$s['id'].'" type="button" class="btn btn-danger" onclick="deletePopup(this.id)" style="width: auto;">Reject</button>
                        </td>
                    </tr>';
                    $i++;
                } 
            }
            else{
                echo "<tr><td>You have not received any requests.</td></tr>";
            }
            ?>
        </tbody>
        </table>
    </div>
  </div>
  </div>
  <script>
// Get the modal
var modal = document.getElementById("confirmationModal");
var acceptModal = document.getElementById("acceptModal");
// Get the button that opens the modal
var btn = document.getElementById("profileImageButton");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var span2 = document.getElementsByClassName("close")[1];
var btnId;
// When the user clicks the button, open the modal 
/*btn.onclick = function() {
  
}*/

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
  acceptModal.style.display = "none";
}
span2.onclick = function() {
  acceptModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
    acceptModal.style.display = "none";
  }
}

function deletePopup(clickedID){
    modal.style.display = "block";
    var requestID = clickedID.split("_")[1];
    document.getElementById('requestID_input').value = requestID;
}

function acceptPopup(clickedID){
    acceptModal.style.display = "block";
    var requestID = clickedID.split("_")[1];
    document.getElementById('acceptRequestID_input').value = requestID;
}

</script>

	 <!-- Footer -->
  <?php include "includes/footer.php"
  ?>

</body>
</html> 