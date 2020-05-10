<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Faculty LogIn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        body
        {
            background: #3A526F;
        }
        .login-form {
            width: 340px;
            margin: 50px auto;
        }
        .login-form form {
            margin-bottom: 15px;
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .login-form h2 {
            margin: 0 0 15px;
        }
        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }
        .btn {
            font-size: 15px;
            font-weight: bold;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function(){

            $("#submit").click(function(){

                var username=$("#username").val();
                var password=$("#password").val();

                var data={
                    "username" : username,
                    "password" : password
                }

                if(username.length==0 || password.length==0)
                    alert("Please check you input.");
                else
                {
                    $.ajax(
                        {
                            url: "http://localhost:8080/faculty_war_exploded/rest/login/doop",
                            type: "POST",
                            async:false,
                            dataType: 'json',
                            contentType : "application/json",
                            data :JSON.stringify(data),
                            success: function (response){

                                if(response["id"]==="Error") {
                                    alert("Check your username and password!");
                                }
                                else{
                                    sessionStorage.setItem('email',$("#username").val());
                                    var p = "9998070555";
                                    sessionStorage.setItem('phno',p);
                                    console.log(sessionStorage);
                                    window.location.href="http://localhost:8080/faculty_war_exploded/Sal_Details.jsp";
                                }

                            },
                            error:function(response){
                                alert("Check your username and password!");
                            }
                        });
                }
            });
        });
    </script>
</head>
<body>

<div class="login-form">
    <form>
        <h2 class="text-center">Faculty LogIn</h2>
        <div class="form-group">
            <input type="text" id="username" class="form-control" placeholder="Username" required>
        </div>
        <div class="form-group">
            <input type="password" id="password" class="form-control" placeholder="Password" required>
        </div>
        <div class="form-group">
            <button type="button" id="submit" class="btn btn-primary btn-block">Log in</button>
        </div>

    </form>

</div>
</body>
</html>