<?php
    include("database/database.php");
    echo "haha";
    die();
    $name = $_POST['name'];
    $content = $_POST['content'];
    $users_id = $_SESSION["userid"];
    $checkin = "Ha Noi";
    $sql = "INSERT INTO  posts (name,content,checkin,users_id) values ('$name', '$content','$checkin','$users_id')";
    if (mysqli_query($conn, $sql)) {
        echo json_encode(array("statusCode" => 200));
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

?>
