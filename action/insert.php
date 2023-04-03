<?php
    include 'koneksi.php';
    $message="";
    $name = $_POST['name']; 
    $nip = $_POST['nip']; 
    $division = $_POST['division']; 
    $level = $_POST['level']; 
    $pob = $_POST['pob']; 
    $bod = $_POST['bod']; 
    $phone = $_POST['phone']; 
    $email = $_POST['email']; 
    $address = $_POST['address'];
    $photo = $_FILES['photo']['name'];
    $imagePath = 'photoDocs/'.$photo;
    $tmp_name = $_FILES['photo']['tmp_name']; 

        move_uploaded_file($tmp_name,$imagePath);
    
        $query="INSERT INTO
        employe(id,name,nip,division,level,pob,bod,phone,email,address,photo)
         VALUES
         (NULL,'$name','$nip','$division','$level','$pob','$bod','$phone','$email','$address','$photo')";
        $exe = mysqli_query($conn,$query) ;
        if ($exe) {
           $message="Success To Added Data !";
           json_encode($message);
           echo $message;
        }else{
            echo 'Failed';
        }
    
  
?>