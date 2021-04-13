<%@ page import ="java.sql.*" %>
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
    <li><a href="customer.jsp">Home</a></li>
    <li style = "float:right"><a href="logout.jsp">Logout</a></li>
  </ul>

    <text>
    <h1>Train Schedule</h1>
    </text>
    
    <%
    String origin = request.getParameter("org");   
    String destination = request.getParameter("dest");
    String date = request.getParameter("time");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs;
    
    if (origin.isEmpty() == true && destination.isEmpty() == true && date.isEmpty() == true){
    	out.println("<text>Please make sure you have atleast one input.</text>");
    }else{
    	rs = null;
    	
    	if (origin.isEmpty() == false && destination.isEmpty() == false && date.isEmpty() == false){
    	  	rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND c.Origin = '"+ origin +"' AND c.Destination = '" + destination + "' AND t.DepartureDateTime = '"+ date + "';");																		    		
    	
    	}else if (origin.isEmpty() == false && destination.isEmpty() == true && date.isEmpty() == true){
    		rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND c.Origin = '"+ origin +"';");
    	
    	}else if (origin.isEmpty() == false && destination.isEmpty() == false && date.isEmpty() == true){
    		rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND c.Origin = '"+ origin +"' AND c.Destination = '" + destination + "';");
    	
    	}else if (origin.isEmpty() == false && destination.isEmpty() == true && date.isEmpty() == false){
    		rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND c.Origin = '"+ origin +"' AND t.DepartureDateTime = '" + date + "';");
    	
    	}else if (origin.isEmpty() == true && destination.isEmpty() == false && date.isEmpty() == true){
    		rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND c.Destination = '"+ destination +"';");
    		
    	}else if (origin.isEmpty() == true && destination.isEmpty() == true && date.isEmpty() == false){
    		rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND t.DepartureDateTime = '"+ date + "';");
    	
    	}else{
    	  	rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND c.Destination = '" + destination + "' AND t.DepartureDateTime = '"+ date + "';");																		    		
    	}

    	
    	%>
    	<div class = "box-3">
  		<div class = "table-wrap">
     	<table class = "sortable">
  	  <tr>
  	    <th><u>Transit Line</u></th>
  	    <th><u>Fare</u></th>
  	    <th><u>Origin</u></th>
  	    <th><u>Destination</u></th>
  	    <th><u>TravelTime</u></th>
  	   	<th><u>Arrival Time</u></th>
  	    <th><u>Departure Time</u></th>
  	    <th><u>Stops</u></th>
  	  </tr><%
  	    	  
  	while(rs.next()){
  		
  		out.println("<tr>");
		for(int i = 1; i <= 8; i++){
			
			if (i == 2){
				out.println("<td>$"+(rs.getString(i))+"</td>");
			}else{
			out.println("<td>"+(rs.getString(i))+"</td>");
			}
		}
		out.println("</tr>");
  	}
    	
    	
    }
    
    %>

</body>



</html>