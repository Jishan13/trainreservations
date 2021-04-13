<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer List</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/style1.css">
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
String TransitLineName = request.getParameter("TransitLineName");
String Date =  request.getParameter("Date");
if (TransitLineName.equalsIgnoreCase("null")||Date.equalsIgnoreCase("null")){
	out.print("Invalid entry");
	return;
}
Statement st1 = con.createStatement();
ResultSet rs20 = st1.executeQuery("SELECT * FROM Reservation WHERE transitLine='"+TransitLineName+"'");
if(!rs20.next()){
 out.println("No reservation made to such TransitLine");
 return;
}
%>
</text>
<h6 align="center" style="color:white">Customer List</h6></br>
<table align="center" cellpadding = "5" cellspacing = "5" border="1" style = "border: 1px solid white; width: 80%;font-size:15px">
    <thead>
     <tr style ="background-color:#a2c3c3;">
        <td style ="color: black;font-size:18px"align="center"><b>First Name</b></td>
        <td style ="color: black;font-size:18px"align="center"><b>Last Name</b></td>
    </tr>
    <%
    String getQuery ="select distinct c.FirstName,c.LastName FROM Customer c WHERE c.username in ( select Passenger FROM Reservation WHERE transitLine = '" +
            TransitLineName+"'and CAST(departTime as DATE) = '"+Date+"'and canceled<>1);";
    ResultSet rs = st.executeQuery(getQuery);
    //boolean NotEmpty = rs.next();
    while(rs.next()){
    %>
    <tr>
    <td style="width:10"><%= rs.getString(1) %></td>
    <td style="width:10"><%= rs.getString(2) %></td>
    </tr>
    <%} %>
    </thead>
    </table>
</body>
</html>