<?php
   include("config.php");

   session_start();
   /*
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      $conn = mysqli_connect("localhost", "root", "","car_database");
      $username = mysqli_real_escape_string($conn,$_POST['username']);
      $password = mysqli_real_escape_string($conn,$_POST['password']); 
      
      $sql = "SELECT * FROM users WHERE name = '$username' and password = '$password'";
      $result = mysqli_query($conn,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
    
      if($count == 1) {
         $_SESSION['login_user'] = $username;
     
      if($row["admin"]==1)
        header("location:admin.php"); // Redirecting To Other Page
      else
        header("location:bankInfo.php"); // Redirecting To Other Page
        }
   }
?>*/
if ($_SERVER["REQUEST_METHOD"] == "POST") {
$db = mysqli_connect('localhost', 'root', '', 'car_database');
  $username = mysqli_real_escape_string($db, $_POST['name']);
  $password = mysqli_real_escape_string($db, $_POST['password']);

   $query = "SELECT * FROM users WHERE name='$username' AND password='$password'";
   $results = mysqli_query($db, $query);
   $row = mysqli_fetch_array($results,MYSQLI_ASSOC);
   $count = mysqli_num_rows($results);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
    
      if($count != 0) {
         $_SESSION['login_user'] = $username;
     
      if($row["admin"]==1){
        header("location:admin.php"); // Redirecting To Other Page
      }else {

        header("location:car.php"); 
      }  // Redirecting To Other Page
        
      }
  
}

?>
<html>
   
   <head>
      <title>Login Page</title>
      
      <style type = "text/css">
         body {
            font-family:Arial, Helvetica, sans-serif;
            font-size:14px;
         }
         label {
            font-weight:bold;
            width:100px;
            font-size:14px;
         }
         .box {
            border:#666666 solid 1px;
         }

      </style>
      
   </head>
   
   <body bgcolor = "#FFFFFF">
  
      <div align = "center">
         <div style = "width:300px; border: solid 1px #333333; " align = "left">
            <div style = "background-color:#333333; color:#FFFFFF; padding:3px;"><b>Login</b></div>
        
            <div style = "margin:30px">
               
               <form action ="" method = "post">
                  <label>Name : </label><input type = "text" name = "name" class = "box"/> <br /><br/>
                  <label>Password :</label><input type = "password" name = "password" class = "box" /><br/><br />
                  <input type = "submit" name="login_user" value = " Submit "/><br />
                  <center>
                <br>
                <h1>Already registered ?</h1> 
            <br>
            <button><a href="registration.php"/>Register<br/> here </a></button>
        </center><!--for centered text-->  

               </form>
               
               <div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php //echo $error; ?></div>
          
            </div>
        
         </div>
      
      </div>

   </body>
</html>