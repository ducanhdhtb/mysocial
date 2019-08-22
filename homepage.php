<?php
session_start();
if(!isset($_SESSION["userid"])){
    return false;
}
require_once("header.php");
require_once("nagivation.php"); ?>
<div class="container">
    <div class="row">

        <div class="col-md-3 content">
            <!-- Button trigger modal -->
            <script>
                $(document).on('click', '#hihi', function (e) {
                    e.preventDefault();
                    var data = $("#form-post").serialize();
                    $.ajax({
                        data: data,
                        type: "POST",
                        url: "http://localhost/mysocial/process-post.php",
                        success: function (response) {
                            //alert('Post in successfully !');
                            //window.location.href = "homepage.php";
                            location.reload();
                            // $('#card-header').innerHTML("Regis success!");
                            // document.getElementById("#card-header").innerHTML = "Paragraph changed!";
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert('Sign in Failed!');
                        }

                    });
                });

            </script>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Write Posts!
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="form-post" method="post">
                                <label for="exampleInputEmail1">Name Post</label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" placeholder="Enter name" name="name">
                                <label for="Post content">Post content</label>
                                <textarea name="content" class="form-control z-depth-1" id="exampleFormControlTextarea6"
                                          rows="3" placeholder="Write something here..."></textarea>
                                </button>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" name="submit" id="hihi">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9 nav">
            <div class="showpost" style="height: 1500px;overflow: scroll;width: 100%">
                <?php
                include("database/database.php");
                $sql = "SELECT * FROM posts INNER JOIN users ON posts.users_id = users.id where users_id = $_SESSION[userid]";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while ($row = mysqli_fetch_assoc($result)) { ?>
                        <!--                        echo "id: " . $row["id"]. " - Name: " . $row["name"]. " " . $row["content"]. $row['username']. "<br>";-->
                        <div class="list-item">
                            <span class="create_at"><?php echo $row["created_at"]; ?></span>

                            <div class="content-post"
                                 style="border:1px solid #00000014;width: 100%;background-color:#007bff;color:white;border-radius:50px;border:1px solid 00000014;padding:40px;margin-bottom:20px"><?php echo $row["content"]; ?></div>
                        </div>
                    <?php }
                } ?>
            </div>
        </div>
    </div>
</div>
<?php
require_once("footer.php");
?>
