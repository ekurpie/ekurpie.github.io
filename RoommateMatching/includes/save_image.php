<?php require 'config.php';
	session_start();
	$userid = $_SESSION['userid'];
    
	if (isset($userid)){
		$file = $_FILES['file'];

		$fileName = $file['name'];
		$fileTmpName = $file['tmp_name'];
		$fileSize = $file['size'];
		$fileError = $file['error'];
		$fileType = $file['type'];
		
		$fileExt = explode('.', $fileName);
		$fileActualExt = strtolower(end($fileExt));
		
		$allowedExtensions = array('jpg', 'jpeg', 'png', 'pdf');
        
        
		if(in_array($fileActualExt, $allowedExtensions)){
			if($fileError === 0){
				if($fileSize < 1000000){
					$fileNameNew = "profile".$userid.".".$fileActualExt;
					$fileDestination = 'data/uploads/'.$fileNameNew;
					
					move_uploaded_file($fileTmpName, '../'.$fileDestination);
					
					$sql = "UPDATE student
							SET image_path = '$fileDestination'
							WHERE user_id = '$userid'";
					
					$result = mysqli_query($DB_CONN, $sql);
					
					header("Location: ../my_profile.php?image_saved");
				}
				else{
					echo "File size limit exceeded";
				}
			}	
		}
		else{
			echo "Invalid file type.";
		}
	}