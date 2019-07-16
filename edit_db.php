<?php
function updateDB($sql){
     $fname=$_POST['name'];
	$sql = "UPDATE categories SET name ='$fname' WHERE student_id = '$get_id' ";

	$conn = mysqli_connect("localhost", "root", "", "car_database");
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}
	if(mysqli_query($conn, $sql)) {
		echo "New records updated successfully";
	}
	else{
		echo "Error: " . $sql . "<br>" . mysqli_error($conn);
	}
}

?>