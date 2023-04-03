<?php
    include 'koneksi.php';


    $id=$_GET['id'];
    $name=$_POST['name'];
    $nip= $_POST['nip'];
    $div=$_POST['division'];
    $lev=$_POST['level'];
    $pob=$_POST['pob'];
    $bod=$_POST['bod'];
    $phone=$_POST['phone'];
    $email=$_POST['email'];
    $query = "UPDATE employe SET name='$name',nip='$nip',division='$div',level='$lev',pob='$pob',bod='$bod',phone='$phone',email='$email' WHERE id='$id' ";
    $exe=mysqli_query($conn,$query);
    if ($exe) {
      echo  json_encode(array(true));
    }else{
      echo  json_encode(array(false));
    }

?>