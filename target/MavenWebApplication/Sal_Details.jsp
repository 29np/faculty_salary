<!DOCTYPE html>
<br lang="en">
<head>
    <title>Salary Details</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style type="text/css">
        body
        {
            background: #BDC4CB;
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
            margin: 0 0 25px;
        }
        .form-control{
            min-height: 38px;
            border-radius: 2px;
            margin : 0 25px 0 10px
        }
        .btn {
            font-size: 15px;
            font-weight: bold;
            align-content: center;
            text-align: center;
        }
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 50%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
        img {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <script type="text/javascript">

         $(document).ready(function(){

             var un = sessionStorage.getItem('email');
             baseUrl = 'http://localhost:8080/faculty_war_exploded/rest';

             var data = {
                 "name": un,
                 "photo": "jj"
             }
             $.ajax(
                 {
                     url: "http://localhost:8080/faculty_war_exploded/rest/login/getphoto",
                     type: "POST",
                     async:false,
                     dataType: 'json',
                     contentType : "application/json",
                     data :JSON.stringify(data),
                     success: function (response){
                         document.getElementById("pic").src = response["photo"];
                         document.getElementById("name").innerHTML = response["name"];
                     }
                 });

             function getalldetails(path)
             {
                 var data = {
                     "username": un,
                     "monthno": 1,
                     "year": 2019
                 }
                 $.ajax(
                     {
                         url: "http://localhost:8080/faculty_war_exploded/rest/sal"+path,
                         type: "POST",
                         async:false,
                         dataType: 'json',
                         contentType : "application/json",
                         data :JSON.stringify(data),
                         success: function (response){
                             var t = "a1";
                             for (var i = 0; i < response["sal"].length; i++) {

                                 l = i+1;
                                 document.getElementById(l.toString()).style.display = '';
                                 document.getElementById(t).innerHTML = response["sal"][i]["monthno"];
                                 x = String.fromCharCode(t.charCodeAt(0));
                                 y = String.fromCharCode(t.charCodeAt(1) + 1);
                                 t = x.concat(y);
                                 document.getElementById(t).innerHTML = response["sal"][i]["year"];
                                 x = String.fromCharCode(t.charCodeAt(0));
                                 y = String.fromCharCode(t.charCodeAt(1) + 1);
                                 t = x.concat(y);
                                 if (response["sal"][i]["part1"] !== undefined) {
                                     document.getElementById(t).innerHTML = response["sal"][i]["part1"];
                                     x = String.fromCharCode(t.charCodeAt(0));
                                     y = String.fromCharCode(t.charCodeAt(1) + 1);
                                     t = x.concat(y);
                                     document.getElementById(t).innerHTML = response["sal"][i]["amount1"];
                                     x = String.fromCharCode(t.charCodeAt(0));
                                     y = String.fromCharCode(t.charCodeAt(1) + 1);
                                     t = x.concat(y);
                                 }
                                 if (response["sal"][i]["part2"] !== undefined) {
                                     document.getElementById(t).innerHTML = response["sal"][i]["part2"];
                                     x = String.fromCharCode(t.charCodeAt(0));
                                     y = String.fromCharCode(t.charCodeAt(1) + 1);
                                     t = x.concat(y);
                                     document.getElementById(t).innerHTML = response["sal"][i]["amount2"];
                                     x = String.fromCharCode(t.charCodeAt(0));
                                     y = String.fromCharCode(t.charCodeAt(1) + 1);
                                     t = x.concat(y);
                                 }
                                 if (response["sal"][i]["part3"] !== undefined) {
                                     document.getElementById(t).innerHTML = response["sal"][i]["part3"];
                                     x = String.fromCharCode(t.charCodeAt(0));
                                     y = String.fromCharCode(t.charCodeAt(1) + 1);
                                     t = x.concat(y);
                                     document.getElementById(t).innerHTML = response["sal"][i]["amount3"];
                                     x = String.fromCharCode(t.charCodeAt(0));
                                     y = String.fromCharCode(t.charCodeAt(1) + 1);
                                     t = x.concat(y);
                                 }
                                 q = String.fromCharCode(t.charCodeAt(0));
                                 w = "9";
                                 e = q.concat(w);
                                 document.getElementById(e).innerHTML = response["s"] -
                                     response["sal"][i]["amount1"] - response["sal"][i]["amount2"] - response["sal"][i]["amount3"];
                                 x = String.fromCharCode(t.charCodeAt(0) + 1);
                                 b = "1";
                                 y = String.fromCharCode(b.charCodeAt(0));
                                 t = x.concat(y);
                             }
                         }
                     });
             }


             function getparticulardetails(path,m,y)
             {
                 var data = {
                     "username": un,
                     "monthno": m,
                     "year": y
                 }
                 for (var i = 0; i < 5; i++) {

                     l = i + 1;
                     document.getElementById(l.toString()).style.display = 'none';
                 }
                 $.ajax(
                     {
                         url: "http://localhost:8080/faculty_war_exploded/rest/sal"+path,
                         type: "POST",
                         async:false,
                         dataType: 'json',
                         contentType : "application/json",
                         data :JSON.stringify(data),
                         success: function (response) {
                             document.getElementById("1").style.display = '';
                             document.getElementById("a1").innerHTML = m;
                             document.getElementById("a2").innerHTML = y;
                             if (response["s"]["part1"] !== undefined) {
                                 document.getElementById("a3").innerHTML = response["s"]["part1"];
                                 document.getElementById("a4").innerHTML = response["s"]["amount1"];
                             }
                             if (response["s"]["part2"] !== undefined) {
                                 document.getElementById("a5").innerHTML = response["s"]["part2"];
                                 document.getElementById("a6").innerHTML = response["s"]["amount2"];
                             }
                             if (response["s"]["part3"] !== undefined) {
                                 document.getElementById("a7").innerHTML = response["s"]["part3"];
                                 document.getElementById("a8").innerHTML = response["s"]["amount3"];
                             }
                             document.getElementById("a9").innerHTML = response["salary"]-response["s"]["amount1"]-response["s"]["amount2"]-response["s"]["amount3"];
                         }
                     });
             }
             $("#getall").click(function() {
                 getalldetails("/getall");
             });
             $("#submit").click(function() {

                 var m=$("#monthno").val();
                 var y=$("#year").val();
                 getparticulardetails("/getparticular",m,y);
             });
         });
    </script>
</head>
<br>

<br class="container">
    </br>
    <h1 class="text-center">Salary Details</h1>
    </br>
    <form class="form-inline" action="/action_page.php" align="center">
        <div class="form-group">
            <label for="monthno">Month Number:</label>
            <input type="number" class="form-control" id="monthno" placeholder="Enter Month" name="Monthno">
        </div>
        <div class="form-group">
            <label for="Year">Year:</label>
            <input type="number" class="form-control" id="year" placeholder="Enter Year" name="Year">
        </div>
    </br>
        </br>
    </form>
    </br>
<div align="center">
<button class="btn" id="submit"> Search</button>
<button class="btn" id="getall" > Get All Details</button>
</div>
    </br>
</div>
</br>
    <h2 align="center" id="name" >Details</h2>


    <img src="data:image/png;base64,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" id="pic" height="250" width="200">
    </br>
    </br>
    <table align="center">
        <tr>
            <th>Month</th>
            <th>Year</th>
            <th>Salary1</th>
            <th>Amount1</th>
            <th>Salary2</th>
            <th>Amount2</th>
            <th>Salary3</th>
            <th>Pending</th>
            <th>Pending</th>
            <th>Download</th>
        <tr style="display:none;" id="1">
            <td id="a1">-</td>
            <td id="a2">-</td>
            <td id="a3">-</td>
            <td id="a4">-</td>
            <td id="a5">-</td>
            <td id="a6">-</td>
            <td id="a7">-</td>
            <td id="a8">-</td>
            <td id="a9">-</td>
            <td><img src="https://image.flaticon.com/icons/svg/0/532.svg"  height="20"></td>
        </tr>
        <tr style="display:none;" id="2">
            <td id="b1">-</td>
            <td id="b2">-</td>
            <td id="b3">-</td>
            <td id="b4">-</td>
            <td id="b5">-</td>
            <td id="b6">-</td>
            <td id="b7">-</td>
            <td id="b8">-</td>
            <td id="b9">-</td>
            <td><img src="https://image.flaticon.com/icons/svg/0/532.svg" height="20"></td>
        </tr>
        <tr style="display:none;" id="3">
            <td id="c1">-</td>
            <td id="c2">-</td>
            <td id="c3">-</td>
            <td id="c4">-</td>
            <td id="c5">-</td>
            <td id="c6">-</td>
            <td id="c7">-</td>
            <td id="c8">-</td>
            <td id="c9">-</td>
            <td><img src="https://image.flaticon.com/icons/svg/0/532.svg" height="20"></td>
        </tr>
        <tr style="display:none;"id="4">
            <td id="d1">-</td>
            <td id="d2">-</td>
            <td id="d3">-</td>
            <td id="d4">-</td>
            <td id="d5">-</td>
            <td id="d6">-</td>
            <td id="d7">-</td>
            <td id="d8">-</td>
            <td id="d9">-</td>
            <td><img src="https://image.flaticon.com/icons/svg/0/532.svg" height="20"></td>
        </tr>
        <tr style="display:none;" id="5">
            <td id="e1">-</td>
            <td id="e2">-</td>
            <td id="e3">-</td>
            <td id="e4">-</td>
            <td id="e5">-</td>
            <td id="e6">-</td>
            <td id="e7">-</td>
            <td id="e8">-</td>
            <td id="e9">-</td>
            <td><img src="https://image.flaticon.com/icons/svg/0/532.svg" height="20"></td>
        </tr>
    </table>
    </br>
    </br>
    </br>
    </br>
</body>
</html>
