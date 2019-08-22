<?php
session_start();
if (!isset($_SESSION["userid"])) {
    return false;
}
require_once("header.php");
require_once("nagivation.php"); ?>
<div class="container">

    <div class="row">
        <div class="col-md-12 nav">
            <div class="showpost" style="height: 1500px;overflow: scroll;width: 100%">
                <?php
                include("database/database.php");
                $sql = "SELECT * FROM users INNER JOIN posts ON  users.id = posts.users_id";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while ($row = mysqli_fetch_assoc($result)) { ?>
                        <!--                        echo "id: " . $row["id"]. " - Name: " . $row["name"]. " " . $row["content"]. $row['username']. "<br>";-->
                        <div class="list-item">
                            <span class="create_at"><?php echo $row["created_at"]; ?></span>

                            <div class="content-post"
                                 style=";width: 100%;background-color:#007bff;color:white;border-radius:50px;padding:40px;margin-bottom:20px"><?php echo $row["content"]; ?></div>
                        </div>
                        <!--                        --><?php
//                        var_dump($row);
//                        die();
//                        ?>

                        <div class="tool">
                            <button>Like</button>
                            <button>Comment</button>
                            <button id="share" onclick="send(<?php echo $row['users_id'] ?>,<?php echo $row["id"]; ?>)"
                                    post-id="<?php echo $row['id']; ?>">Share
                            </button>
                        </div>

                    <?php }
                } ?>
            </div>
            <script>
                function send(param1, param2) {
                    $.ajax({
                        data: [param1, param2],
                        type: "POST",
                        url: "process-list.php",
                        success: function (response) {
                            alert('Data updated successfully !');
                            //window.location.href = "login.php";
                            //window.reload();
                            // $('#card-header').innerHTML("Regis success!");
                            // document.getElementById("#card-header").innerHTML = "Paragraph changed!";
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert('error');
                        }

                    });
                }

            </script>

        </div>
    </div>
</div>
<?php
require_once("footer.php");
?>
