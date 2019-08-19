<!DOCTYPE HTML>
<html>
<head>
    <title>User Signup</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<?php
include("database/database.php");


$fullname = $_POST['full-name'];
$email = $_POST['email-address'];
$username = $_POST['username'];
$phone = $_POST['phone-number'];

$presentAddress = $_POST['presentAddress'];
$permanentAddress = $_POST['permanent-address'];
$password = $_POST['password'];

$sql = "INSERT INTO users(fullname,email,username,phoneNumber,presentAddress,permanentAddress,password)
		VALUES ('$fullname','$email','$username','$phone','$presentAddress','$permanentAddress','$password')";


if (mysqli_query($conn, $sql)) {
    echo json_encode(array("statusCode" => 200));
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}


//?>
</body>
</html>