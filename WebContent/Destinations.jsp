<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Destinations</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/style1.css">
  <link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="Images/Tab-Picture.jpg">
</head>
<body>
 <ul>
    <li><a href="customerRep.jsp">Home</a></li>
    <li><a href="questions.jsp">Pending Questions</a></li>
    <li style = "float:right"><a href="logout.jsp">Logout</a></li>
  </ul>
  <text>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
Statement st = con.createStatement();
String StopName = request.getParameter("StationName");
if(StopName.equalsIgnoreCase("null")){
	out.println("Invalid Entry");
	return;
}
%>
</text>
<h6 align="center" style="color:white">Train Schedule Where origin is <%=StopName %></h6></br>
<table align="center" cellpadding = "5" cellspacing = "5" border="1" style = "border: 1px solid white; width: 80%;font-size:15px">
    <thead>
     <tr style ="background-color:#a2c3c3;">
        <td style ="color: black;font-size:18px"align="center"><b>TransitLineName</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>Fare</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>TravelTime</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>ArrivalDateTime</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>DepartureDateTime</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>Stops</b></td>
    </tr>
    <text>
    <%
    String getQuery = "select * FROM TrainSchedule WHERE TransitLineName in (SELECT TransitLineName FROM Contains WHERE Origin ='"+StopName+"')";
    ResultSet rs = st.executeQuery(getQuery);
    //boolean NotEmpty = rs.next();
    while(rs.next()){
    %>
    </text>
    <tr >
    <td align="center"><%= rs.getString(1) %></td>
    <td align="center"><%= rs.getString(2) %></td>
    <td align="center"><%= rs.getString(3) %></td>
    <td align="center"><%= rs.getString(4) %></td>
    <td align="center"><%= rs.getString(5) %></td>
    <td align="center"><%= rs.getString(6) %></td>
    </tr>
    <%} %>
    </thead>
    </table>
    <br>
    <h6 align="center" style="color:white">Train Schedule Where destination is <%=StopName %></h6></br>
    <table align="center" cellpadding = "5" cellspacing = "5" border="1" style = "border: 1px solid white; width: 80%;font-size:15px">
    <thead>
     <tr style ="background-color:#a2c3c3;">
        <td style ="color: black;font-size:18px"align="center"><b>TransitLineName</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>Fare</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>TravelTime</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>ArrivalDateTime</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>DepartureDateTime</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>Stops</b></td>
    </tr>
    <text>
    <%String getNextQuery = "select * FROM TrainSchedule WHERE TransitLineName in (SELECT TransitLineName FROM Contains WHERE Destination ='"+StopName+"')";
    ResultSet rs1 = st.executeQuery(getNextQuery);
    //boolean NotEmpty = rs.next();
    while(rs1.next()){
    %>
       </text>
    <tr >
    <td align="center"><%= rs1.getString(1) %></td>
    <td align="center"><%= rs1.getString(2) %></td>
    <td align="center"><%= rs1.getString(3) %></td>
    <td align="center"><%= rs1.getString(4) %></td>
    <td align="center"><%= rs1.getString(5) %></td>
    <td align="center"><%= rs1.getString(6) %></td>
    </tr>
    <%} %>
    </thead>
    </table>
    <br>
</body>
</html>