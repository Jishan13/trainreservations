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
    <li style = "float:right"><a href="logout.jsp">Logout</a></li>
  </ul>

    <text>
    <h1>Train Schedule</h1>
    </text>


    <% 
    if ((session.getAttribute("user") == null)){
    %>
   <text><p>Not logged in. Please make an account or login to get started.</p></text>
   <% 
    } else if ((session.getAttribute("type") == "customer")){
    	response.sendRedirect("customer.jsp");
    } else if ((session.getAttribute("type") == "admin")){
    	response.sendRedirect("admin.jsp");
    } else if ((session.getAttribute("type") == "customerRep")){
    	response.sendRedirect("customerRep.jsp");
    } else{
    	out.println("error");
    }
    %>
</body>



</html>