<?php

include 'koneksi.php';
$nip='';

    if (isset($_GET['nip'])) {
        $nip=$_GET['nip'];
        $query = "DELETE FROM employe WHERE nip = '$nip'";
        $exe=mysqli_query($conn,$query);
        $list=array();
    }