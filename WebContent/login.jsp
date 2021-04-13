<!DOCTYPE html>
<html>

<head>
  <title>Train Tickets</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="Images/Tab-Picture.jpg">
</head>


<body>

  <ul>
    <li><a href="index.jsp">Home</a></li>
    <li style = "float:right"><a href="login.jsp">Login/Signup</a></li>
  </ul>


    <div class="box-1">
      <p><div class = "login"> Login </div></p>
      <div class = "login-align">
      <form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password: <input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
       </form>
     </div>
    </div>

    <div class="box-2">
      <p><div class = "login"> Signup </div></p>
      <div class = "login-align">
      <form action="signup.jsp" method="POST">
      Username: <input type="text" name="username"/> <br/>
      Password: <input type="password" name="password"/> <br/>
      Email: <input type="text" name="Email"/> <br/>
      First Name: <input type="text" name="First Name"/> <br/>
      Last Name: <input type="text" name="Last Name"/> <br/>
      <input type="submit" value="Submit"/>
      </form>
    </div>
    </div>

</body>
</html>