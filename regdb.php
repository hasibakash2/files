<?php
include 'config.php';

$name=$_POST['name'];
$gender=$_POST['gender'];
$email=$_POST['email'];
$phone=$_POST['phone'];
$address=$_POST['address'];
$district=$_POST['district'];
$city=$_POST['city'];
$pass=md5($_POST['pass']);
$cpass=md5($_POST['cpass']);
$sql = "INSERT INTO registration (name, gender, email,phone,address,district,city,password,confirmpassword)
VALUES ('$name', '$gender', '$email','$phone','$address','$district','$city','$pass','$cpass')";
if ($conn->query($sql) === TRUE) {
     echo "";
} else {
	echo header("location:users.php");
   
}

$conn->close();
?>





