<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header" id="card-header">Register</div>
                    <div class="card-body">
                        <!--                        onsubmit="return validform()" action="success.php" method="post"-->
                        <form id="user_form" method="post">
                            <div class="form-group row">
                                <label for="full_name" class="col-md-4 col-form-label text-md-right">Full Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="full_name" class="form-control" name="full-name">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="email-address">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="user_name" class="col-md-4 col-form-label text-md-right">User Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="user_name" class="form-control" name="username">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="phone_number" class="col-md-4 col-form-label text-md-right">Phone Number</label>
                                <div class="col-md-6">
                                    <input type="text" id="phone_number" class="form-control" name="phone-number">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="present_address" class="col-md-4 col-form-label text-md-right">Present Address</label>
                                <div class="col-md-6">
                                    <input type="text" id="present_address" class="form-control" name="presentAddress">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Permanent Address</label>
                                <div class="col-md-6">
                                    <input type="text" id="permanent_address" class="form-control" name="permanent-address">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="nid_number" class="col-md-4 col-form-label text-md-right"><abbr
                                        title="National Id Card">NID</abbr> Password</label>
                                <div class="col-md-6">
                                    <input type="password" id="password" class="form-control" name="password">
                                </div>
                            </div>

                            <div class="col-md-6 offset-md-4">
                                <button type="button" class="btn btn-primary" id="btn-add">
                                    Register
                                </button>

                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>