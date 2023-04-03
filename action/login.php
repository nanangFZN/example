<?php
    include 'koneksi.php';
  
       $username = $_POST['username'];
       $password = md5($_POST['password']);
       $query = "SELECT * FROM users WHERE username ='$username' AND password = '$password' ";
       $exe = mysqli_query($conn,$query);
       if ($exe->num_rows>0) {
        echo json_encode(array("message"=>"Success"));
       }else{
        echo json_encode(array("message"=>"Failed"));
       }

?>