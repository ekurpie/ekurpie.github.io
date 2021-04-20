function browse_submit(var){
  session = var;
  test = "<php? $_SESSION['userid'] = ";
  test2 = test.concat(session);
  test3 = "?>";
  test4 = test2.concat(test3);

  document.write(test4);
    form.submit();
}

function browse_submit2(){
    location.href = 'view_profile.php';
}
