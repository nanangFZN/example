<?php
 include 'koneksi.php';
    $nip='';
    if (isset($_GET['nip'])) {
        $nip=$_GET['nip'];
        $query = "SELECT * FROM employe WHERE nip='$nip' ";
        $exe=mysqli_query($conn,$query);
        $list=array();
        while ($data = $exe->fetch_assoc() ) {
            $list[]=$data;
        }   
        echo json_encode($list);
    }else{
        $exe = mysqli_query($conn,"SELECT * FROM employe");
                $list=array();
            while ($row= $exe->fetch_assoc()) {
                $list[]=$row;

            }
            echo json_encode($list);
    }
    
    
    
?>