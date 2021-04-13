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



    <% 
    String origin = request.getParameter("org");   
    String destination = request.getParameter("dest");
    String date = request.getParameter("time");
    String line = request.getParameter("line");
    String disabled = request.getParameter("sort2");
    String trip = request.getParameter("sort1");
    String child = request.getParameter("sort3");
    String veteran = request.getParameter("sort4");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs;
    
   // out.println("Origin : " + origin + "<br>Destination : " + destination + "<br>Date : " + date + "<br>Line : " + line + "<br>Disabled : " + disabled + "Child " + child + "Verteran : " + veteran + "<br> Trip Type : " +trip);
    
  	rs = st.executeQuery("Select * FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName AND c.Origin = '"+ origin +"' AND c.Destination = '" + destination + "' AND t.DepartureDateTime = '"+ date + "' AND t.TransitLineName = '" + line + "';");																		    		
    if(rs.next() == false){
    	out.println("<text>The information you entered is either wrong, or the schedule you selected is not available.</text>");
    	}else{
    	//out.println("it worked");
    	
    	double totalFare = Double.parseDouble(rs.getString(6));
    	
    	if("disabled".equals(disabled)){
		totalFare = totalFare * .5;
    	}
    	if("child".equals(child)){
    		totalFare = totalFare * .75;
        }
    	
    	if("veteran".equals(veteran)){
    		totalFare = totalFare * .75;
        }
    	
    	int binTrip;
    	
    	
    	if(trip.equals("roundTrip")){
    		totalFare = totalFare * 2;
    		binTrip = 1;
    	}else{
    		binTrip = 0;
    	}
    	
    	rs.beforeFirst();
    	rs.next();
    	
    	int resNum = 0;
    	
    	rs = st.executeQuery("SELECT MAX(ReservationNumber) From Reservation");
    	if(rs.next() == false){
    		out.println("error");
    	}else{
        	resNum = rs.getInt(1) + 1;
    	}
    	
    		//out.println(resNum);
        	
    	st.addBatch("INSERT INTO Reservation VALUES ( " + resNum + ", '" + session.getAttribute("user") + "'," + totalFare + "," + binTrip + ",'" + date + "','" + origin + "','" + destination + "','" + line + "'," + 0 +");");
    	st.executeBatch();
    	
		out.println("<br/><br/><text>You have successfully made the reservation. Your total comes out to $" + String.format("%.2f", totalFare) + "</text>");
    }

    %>
</body>



</html>