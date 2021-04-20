<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<meta name="description" content="">
	  <meta name="author" content="">

	<title>Login | Roommate Matching</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">

	<!-- Main stylesheet -->
	<link rel="stylesheet" href="css/main.css">

	<!-- Add custom styles for this page here -->

</head>
<body>
<style>
div{text-align: center;}
</style>
<script type="text/javascript">
function request_submit(){
  if (window.opener != null && !window.opener.closed) {
            var txtName = window.opener.document.getElementById("notes");
            txtName.value = document.getElementById("notes").value;
            var fieldName = window.opener.document.getElementById("cancel");
            fieldName.value = "two";
						}
            window.close();
	}

function cancel_submit(){
    if (window.opener != null && !window.opener.closed) {
              var txtName = window.opener.document.getElementById("cancel");
              txtName.value = "one";
  						}
              window.close();
  	}
</script>
<div>
  <h4> Please enter the notes for your roommate here </h4>
  <textarea id="notes" name="notes" rows="6" cols="100">
</textarea>
<input type="button" value="Submit" onclick ="request_submit();" />
<input type="button" value="Cancel" onclick ="cancel_submit();" />
</div>
</body>
</html>
