<?php
   include('config.php');
   session_start();
   $conn = mysqli_connect("localhost", "root", "","car_database");

   $user_check = $_SESSION['login_user'];
   
   $ses_sql = mysqli_query( $conn,"select name from users where name = '$user_check' ");
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['name'];
   
   if(!isset($_SESSION['login_user'])){
      header("location:users.php");
   }
?>