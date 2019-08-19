
<!------ Include the above in your HEAD tag ---------->
<?php
require("header.php");
require("nagivation.php");
?>
<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header" id="card-header">Register</div>
                    <div class="card-body">
                        <!--                        onsubmit="return validform()" action="success.php" method="post"-->
                        <form action="process-login.php" method="post">
                            <div class="form-group row">
                                <label for="full_name" class="col-md-4 col-form-label text-md-right">Email</label>
                                <div class="col-md-6">
                                    <input type="text" id="full_name" class="form-control" name="email">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <input type="password" id="email_address" class="form-control" name="password">
                                </div>
                            </div>



                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" name="submit">
                                    Login
                                </button>

                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<?php
require("footer.php");
?>
