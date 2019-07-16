<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
	<link rel="stylesheet" type="text/css" href="css1/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


	<style>
			 th{
			 	width:150px;
			 	height: 35px;
			 	background-color:#000;
			 	color: #fff; 
			    border: 1px solid black;
			    text-align: center;
			}
			td{
				width:150px;
			 	height: 35px; 
			    border: 1px solid black;
			    text-align: center;
			}
			.search-box{
        width: 500px;
        position: relative;
        display: inline-block;
        font-size: 14px;
    }
    .search-box input[type="text"]{
        height: 32px;
        padding: 5px 10px;
        border: 1px solid #CCCCCC;
        font-size: 14px;
        margin-left: 750px;
    }
    .result{
        position: relative;        
        z-index: 999;
        top: 100%;
        left: 0;

    }
    .search-box input[type="text"], .result{
        width: 100%;
        box-sizing: border-box;
    }
    /* Formatting result items */
    .result p{
        margin: 0;
        padding: 7px 10px;
        border: 1px solid #CCCCCC;
        border-top: none;
        cursor: pointer;
        margin-left: 750px;
    }
    .result p:hover{
        background: #f2f2f2;
    }
	</style>
	<script src="search.js"></script>
	 <script>
      
   function validateForm() {
    var x = document.forms["myForm"]["name"].value;
    var y = document.forms["myForm"]["price"].value;
	var z = document.forms["myForm"]["uploaded"].value;

    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
	if (y== "") {
        alert("price must be filled out");
        return false;
    }
	if (z== "") {
        alert("please Select the image file");
        return false;
    }
}
</script>
</head>

<body>
	<?php include('menu.php'); ?>
	<div id="main"  >
      <div class="search-box"  >
       	<h1></h1>
        <input type="text" autocomplete="off" placeholder="Search parts name " />
        <div class="result"></div>
    </div>
		<h1>Add Car Parts</h1>
		<form name="myForm" enctype="multipart/form-data"  action="savepart.php" method="POST">
			
			<p>Name</p>
			<input type="text" name="name">
			<p>Price</p>
			<input type="number" name="price">
			<?php 
				include('config.php'); 
				$sql = "SELECT * FROM cars";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
				    // output data of each row
				    echo '<p>Select Car</p>';
				    echo '<select name="car">' ;
				    while($row = $result->fetch_assoc()) {
				        //echo '<option " . $row["id"]; 
		        		echo '<option value="'.$row["id"].'">'.$row["make"].' '.$row["model"].' '.$row["year"].'</option>';
				    }
				echo '</select>';
				} else {
				    echo "0 results";
				}
				
				$sql = "SELECT * FROM categories";
				$result = $conn->query($sql);
                //echo $row["count(*)"];
				if ($result->num_rows > 0) {
				    // output data of each row
				    echo '<p>Select Category</p>';
				    echo '<select name="category">' ;
				    while($row = $result->fetch_assoc()) {
				        //echo '<option " . $row["id"]; 
		        		echo '<option value="'.$row["id"].'">'.$row["name"].'</option>';
				    }
				echo '</select>';
				} else {
				    echo "0 results";
				}
				$conn->close();
			?>
			<br><br>
			Please choose a file:<br><input name="uploaded" type="file" /><br><br>
			<input type="submit" onClick="return validateForm()" name="" value="Add">
		<br>
		
		</form>
          
		    <?php   
            	include('config.php'); 

		      $sql="SELECT parts.name, parts.price, cars.make, cars.model, cars.year, categories.name AS 'catname'
		         FROM parts LEFT JOIN cars ON parts.cars_id = cars.id LEFT JOIN categories ON parts.categories_id = categories.id";
			
			   $result = $conn->query($sql);
			  $row =  mysqli_num_rows($result);
              echo "Total rows: " . $row;
              echo"<br>";
              echo "<span>Show the all Parts</span>";
			   echo "<table>
				  <tr>
			         <th>name</th>
			         <th>price</th>
			         <th>model</th>
			         <th>make</th>
			         <th>year</th>
			         <th>category</th>
			         <th>Action</th>
			      </tr>";
			   //echo
				if ($result->num_rows > 0) {
				    // output data of each row
				    while($row = $result->fetch_assoc()) {
				        //echo '<option " . $row["id"]; 
				       // echo $row["count(*)"];
				  echo "<tr>";
			      echo "<td>" . $row['name'] . "</td>";
			      echo "<td>" . $row['price'] . "</td>";
			      echo "<td>" .$row["make"].  "</td>";
			       echo "<td>" . $row['model'] . "</td>";
			        echo "<td>" . $row['year'] . "</td>";
			         echo "<td>" . $row['catname'] . "</td>";
			         echo "<td>"."<button> edit</bttuon><button>delete</button>". "</td>";
			      echo "</tr>";
				   }
	   
					} else {
				    echo "0 results";
				}
				echo "</table>";
				$conn->close();

/*SELECT users.name,city.name,district.name,parts.name.parts.price,orders.quantity FROM users
LEFT JOIN orders ON users.id=orders.users_id 
LEFT JOIN users ON city.id=users.city_id
LEFT JOIN city ON district.id=city.district_id
LEFT JOIN orders ON parts.id=orders.parts_id
ORDER BY users.name*/

        ?>
	</div>

</body>
</html>

