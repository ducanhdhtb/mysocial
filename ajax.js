<!-- Add user -->
$(document).on('click','#btn-add',function(e) {
    var data = $("#user_form").serialize();
    console.log(data);
    $.ajax({
        data: data,
        type: "POST",
        url: "signupuser.php",
        success: function(response){
            alert('Data updated successfully !');
            window.location.href = "login.php";
            //window.reload();
            // $('#card-header').innerHTML("Regis success!");
            // document.getElementById("#card-header").innerHTML = "Paragraph changed!";
        },
        error: function(jqXHR, textStatus, errorThrown){
            alert('error');
        }

    });
});

<!-- Add user -->
$(document).on('click','#login-add',function(e) {
    var data = $("#login_form").serialize();
    console.log(data);
    $.ajax({
        data: data,
        type: "POST",
        url: "process-login.php",
        success: function(response){
            alert('Sign in successfully !');
            //window.location.href = "login.php";
            //window.reload();
            // $('#card-header').innerHTML("Regis success!");
            // document.getElementById("#card-header").innerHTML = "Paragraph changed!";
        },
        error: function(jqXHR, textStatus, errorThrown){
            alert('Sign in Failed!');
        }

    });
});
