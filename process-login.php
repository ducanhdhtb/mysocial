
<?php


if(isset($_POST["submit"])){
    include("database/database.php");
    $email = $_POST['email'];
    $password = $_POST['password'];
    $sql = "Select * from users where email = '$email' and password = '$password'";
    $query = mysqli_query($conn, $sql);

if (mysqli_num_rows($query) > 0){
    // If login success. Create sesion and login intosystem
    session_start();
    $sql_select_id = "Select id from users where email = '$email'";
    $queryId =  mysqli_query($conn, $sql_select_id );
    $row = mysqli_fetch_array($queryId);
        $_SESSION["userid"] = $row['id'];
        echo $_SESSION["userid"];
}else{
        echo "Email or Password not true..";
}





}else{
    echo "Not Submit";
}



?>
