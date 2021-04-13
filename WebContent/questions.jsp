<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pending Questions</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/style1.css">
  <link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="Images/Tab-Picture.jpg">
</head>
<body>
<ul>
    <li><a href="customerRep.jsp">Home</a></li>
    <li style = "float:right"><a href="logout.jsp">Logout</a></li>
  </ul>
   <table align="center" cellpadding = "5" cellspacing = "5" border="1">
    <thead>
     <tr>
        <td><b>Question(s)</b></td>
        <td><b>Answers</b></td>
        <td><b>Submit</b></td>
    </tr>
    <%Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    String getQuery = "SELECT Question,UniqueNumber FROM Messages WHERE Answer=''";
    ResultSet rs = st.executeQuery(getQuery);
    while(rs.next()){
    %>
    <form action="" method="POST">
    <tr>
    <input type="hidden" id="question" name="question" value = <%=rs.getString(2)%>>
    <td><%= rs.getString(1)%></td>
    <td> <input type="text" name="Answer" placeholder="Type Answer Here" style="width:100%" required/> </td>
    <td> <button  formaction="answer.jsp" id= submit1>Submit</button></td>
    </tr>
    </form>
    <%} %>
    </thead>
    </table>
    <br>
</body>
</html>