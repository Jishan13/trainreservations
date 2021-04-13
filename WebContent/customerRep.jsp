<%@ page import ="java.sql.*" %>
<html>

<head>
  <title>Train Tickets</title>
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
  <h6>Train Schedule</h6>
  </text>
    <table align="center" cellpadding = "5" cellspacing = "5" border="1">
    <thead>
     <tr>
        <td><b>TransitLineName</b></td>
        <td><b>Fare</b></td>
        <td><b>Travel Time</b></td>
        <td><b>ArrivalDate Time</b></td>
        <td><b>DepartureDate Time</b></td>
        <td><b>Stops</b></td>
    </tr>
    <%Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    String getQuery = "SELECT * FROM TrainSchedule";
    ResultSet rs = st.executeQuery(getQuery);
    while(rs.next()){
    %>
    <tr>
    <td style="width:10"><%= rs.getString(1) %></td>
    <td style="width:10"><%= rs.getString(2) %></td>
    <td style="width:10"><%= rs.getString(3) %></td>
    <td style="width:10"><%= rs.getString(4) %></td>
    <td style="width:10"><%= rs.getString(5) %></td>
    <td style="width:10"><%= rs.getString(6) %></td>
    </tr>
    <%} %>
    </thead>
    </table>
    <br>
    <div>
    <h6 align="center">Edit/Delete TrainSchedule</h6>
     <form action="" method="POST" >
      <label for ="tln">TransitLineName:</label> 
      <input type="text" name="CurrentTransitLineName" placeholder="Current Transit Line Name" required/> <br/>
      <label for ="tln">TransitLineName:</label> 
      <input type="text" name="TransitLineName" placeholder="New Name otherwise leave blank"/> <br/>
     <label for ="fare">Fare: </label>
     <input type="text" name="Fare" placeholder="New Fare or leave blank"/> <br/>
      TravelTime:<input type="text" name="TravelTime" placeholder="New Travel Time or leave blank" /> <br/>
      
     
      ArrivalDateTime: <input type="text" name="ArrivalDateTime" placeholder="New Arrival Time or leave blank" /> <br/>
      
     
      DepartureDateTime: <input type="text" name="DepartureDateTime" placeholder="New Departure Time or leave blank" /> <br/>
     
      
      Stops: <input type="text" name="Stops" placeholder="New Stops or leave blank"/> <br/>
      
     <button type="submit" id= edit  formaction="edit.jsp" name="command" value="edit">Edit</button>
     <button type="submit" id= delete  formaction="edit.jsp" name="command" value="delete">Delete</button>
      </form>
    </div>
    <div class="form2">
      <h6 align="center">Get Train Schedule based on Stations:</h6>
     <form action="" method="POST">
       <label for ="Station" style ="font-size:20px">Station Name:     </label>
       <input type="text" name= "StationName" id = "StationName" required/>
       <button type ="submit"id= submit formaction="Destinations.jsp" name="command" value="Submit">Submit</button>
     </form>
    </div>
    <div class="form3">
     <h6 align="center">Customer info based on reservation:</h6>
      <form action="" method="POST">
      <table style = "border-spacing:15px;">
      <tr>
       <td><label for ="TransitLineName" style ="font-size:20px">TransitLineName:     </label></td>
       <td><input type="text" name= "TransitLineName" id = "TransitLineName" style="width:100%" required/></td>
      <td> <label for ="Date" style ="font-size:20px">Date:     </label></td>
      <td> <input type="text" name= "Date" id = "Date" style="width:100%"required/></td>
      <td><button type ="submit"id= submit formaction="CustomerList.jsp" name="command" value="Retrive">Retrive Info</button></td>
      </tr>
       </table>
     </form>
    </div>
 </body>
 </html>