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
  
  
  		<div class = "box-4">
  		<text>Sort By:</text>
        <FORM NAME="form1" ACTION="customerScripts/customerScripting.jsp" METHOD="POST">
            <INPUT TYPE="submit" VALUE="Arrival Time Ascending" name = "button" ONCLICK="location.href='customerScripts/customerScripting.jsp">
            <INPUT TYPE="submit" VALUE="Departure Time Ascending" name = "button" ONCLICK="location.href='customerScripts/customerScripting.jsp">
            <INPUT TYPE="submit" VALUE="Fare Price Ascending" name = "button" ONCLICK="location.href='customerScripts/customerScripting.jsp">
        </FORM> 
        
          <FORM NAME="form1" ACTION="customerScripts/customerScripting.jsp" METHOD="POST">
            <INPUT TYPE="submit" VALUE="Arrival Time Descending" name = "button" ONCLICK="location.href='customerScripts/customerScripting.jsp">
            <INPUT TYPE="submit" VALUE="Departure Time Descending" name = "button" ONCLICK="location.href='customerScripts/customerScripting.jsp">
            <INPUT TYPE="submit" VALUE="Fare Price Descending" name = "button" ONCLICK="location.href='customerScripts/customerScripting.jsp">
        </FORM> 
  		</div>
  
  <div class = "box-3">
  <div class = "table-wrap">
     <table class = "sortable">
  <% 
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
  Statement st = con.createStatement();
  ResultSet rs;
  
  if (session.getAttribute("bResponse") == "1"){
	  %>
	  <tr>
	   	<th><u>Arrival Time</u></th>
	    <th><u>Transit Line</u></th>
	    <th><u>Fare</u></th>
	    <th><u>Origin</u></th>
	    <th><u>Destination</u></th>
	    <th><u>TravelTime</u></th>
	    <th><u>Departure Time</u></th>
	    <th><u>Stops</u></th>
	  </tr><%
  		rs = st.executeQuery("Select ArrivalDateTime, c.TransitLineName, Fare, Origin, Destination, TravelTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName ORDER BY ArrivalDateTime ASC;"); 
  }  else if (session.getAttribute("bResponse") == "2"){
	  %>
	  <tr>
	   	<th><u>Arrival Time</u></th>
	    <th><u>Transit Line</u></th>
	    <th><u>Fare</u></th>
	    <th><u>Origin</u></th>
	    <th><u>Destination</u></th>
	    <th><u>TravelTime</u></th>
	    <th><u>Departure Time</u></th>
	    <th><u>Stops</u></th>
	  </tr><%
  		rs = st.executeQuery("Select ArrivalDateTime, c.TransitLineName, Fare, Origin, Destination, TravelTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName ORDER BY ArrivalDateTime DESC;"); 
  }else if (session.getAttribute("bResponse") == "3"){
	  %>
	  <tr>
	   	<th><u>Departure Time</u></th>
	    <th><u>Transit Line</u></th>
	    <th><u>Fare</u></th>
	    <th><u>Origin</u></th>
	    <th><u>Destination</u></th>
	    <th><u>TravelTime</u></th>
	    <th><u>Arrival Time</u></th>
	    <th><u>Stops</u></th>
	  </tr><%
  		rs = st.executeQuery("Select DepartureDateTime, c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName ORDER BY DepartureDateTime ASC;"); 
  }else if (session.getAttribute("bResponse") == "4"){
	  %>
	  <tr>
	   	<th><u>Departure Time</u></th>
	    <th><u>Transit Line</u></th>
	    <th><u>Fare</u></th>
	    <th><u>Origin</u></th>
	    <th><u>Destination</u></th>
	    <th><u>TravelTime</u></th>
	    <th><u>Arrival Time</u></th>
	    <th><u>Stops</u></th>
	  </tr><%
  		rs = st.executeQuery("Select DepartureDateTime, c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName ORDER BY DepartureDateTime DESC;"); 
  }else if (session.getAttribute("bResponse") == "5"){
	  %>
	  <tr>
	  	<th><u>Fare</u></th>
	    <th><u>Transit Line</u></th>
	    <th><u>Origin</u></th>
	    <th><u>Destination</u></th>
	    <th><u>TravelTime</u></th>
	    <th><u>Arrival Time</u></th>
	    <th><u>Departure Time</u></th>
	    <th><u>Stops</u></th>
	  </tr><%
  		rs = st.executeQuery("Select Fare, c.TransitLineName, Origin, Destination, TravelTime, ArrivalDateTime,DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName ORDER BY Fare ASC;"); 
  }else if (session.getAttribute("bResponse") == "6"){
	  %>
	  <tr>
	  	<th><u>Fare</u></th>
	    <th><u>Transit Line</u></th>
	    <th><u>Origin</u></th>
	    <th><u>Destination</u></th>
	    <th><u>TravelTime</u></th>
	    <th><u>Arrival Time</u></th>
	    <th><u>Departure Time</u></th>
	    <th><u>Stops</u></th>
	  </tr><%
  		rs = st.executeQuery("Select Fare, c.TransitLineName, Origin, Destination, TravelTime, ArrivalDateTime,DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName ORDER BY Fare DESC;"); 
  }
  else{
	  %>
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
	  	rs = st.executeQuery("Select c.TransitLineName, Fare, Origin, Destination, TravelTime, ArrivalDateTime, DepartureDateTime, Stops FROM `Contains` c , TrainSchedule t WHERE c.TransitLineName = t.TransitLineName;"); 
  }
	while(rs.next()){
		
		int dollarSpot;
		
		if(session.getAttribute("bResponse") == "1" || session.getAttribute("bResponse") == "2" || session.getAttribute("bResponse") == "3" || session.getAttribute("bResponse") == "4"){
			dollarSpot = 3;
		}else if(session.getAttribute("bResponse") == "5" || session.getAttribute("bResponse") == "6"){
			dollarSpot = 1;
		}else{
			dollarSpot = 2;
		}
		
		out.println("<tr>");
		for(int i = 1; i <= 8; i++){
			
			if (i == dollarSpot){
				out.println("<td>$"+(rs.getString(i))+"</td>");
			}else{
			out.println("<td>"+(rs.getString(i))+"</td>");
			}
		}
		out.println("</tr>");
	}
  %>
</table> 
  </div>
  </div>
  
  <div class = "box-5">
  <p><div class = "login"> Trip Search </div></p>
      <div class = "login-align">
      <form action="customerHelper.jsp" method="POST">
       Origin: <input type="text" name="org"/> <br/>
       Destination: <input type="text" name="dest"/> <br/>
       Date Of Travel: <input type="text" name="time"/> <br/>
       <input type="submit" value="Submit"/>
       </form>
     </div>
    </div>
    
      <div class = "box-6">
  <p><div class = "login"> Reservation </div></p>
      <div class = "login-align">
      <form action="reserve.jsp" method="POST">
       Transit Line: <input type="text" name="line"/> <br/>
       Origin: <input type="text" name="org"/> <br/>
       Destination: <input type="text" name="dest"/> <br/>
       Date Of Travel: <input type="text" name="time"/> <br/>
       
       <input type="radio" id="roundTrip" name="sort1" value="roundTrip" checked>
		<label for="sortTL">Round-Trip</label><br/>
		
		<input type="radio" id="oneWay" name="sort1" value="oneWay">
		<label for="sortCN">One-Way</label><br/>
		
		<input type="checkbox" id="disabled" name="sort2" value="disabled">
		<label for="sortTL1">Disabled</label><br/>
		
		<input type="checkbox" id="child" name="sort3" value="child">
		<label for="sortTL1">Child</label><br/>
		
		<input type="checkbox" id="veteran" name="sort4" value="veteran">
		<label for="sortTL1">Veteran</label><br/>

		
       <input type="submit" value="Reserve"/>
       </form>
     </div>
    </div>
  
  
  <div class = "box-3">
  <div class = "table-wrap">
     <table class = "sortable">
  		<tr>
	    <th><u>Reservation #</u></th>
	    <th><u>Fare</u></th>
	    <th><u>Trip Type</u></th>
	    <th><u>Depart Time</u></th>
	    <th><u>Origin</u></th>
	   	<th><u>Destination</u></th>
	    <th><u>Transit Line</u></th>
	  	</tr>
	  	
	  	<% 
	  	

	  	
	  	rs = st.executeQuery("SELECT ReservationNumber, Fare, trip, departTime, origin, destination, transitLine FROM  Reservation WHERE canceled = 0 AND Passenger = '"+ session.getAttribute("user") + "';");
	  	
		out.println("<text>Reservations</text>");
				
	  	while(rs.next()){
	  	out.println("<tr>");
		for(int i = 1; i <= 7; i++){
			
			if(i == 2){
			out.println("<td>$"+(rs.getString(i))+"</td>");
			}else if (i == 3){
				if(rs.getString(i).equals("1")){
					
					out.println("<td>Round Trip</td>");
				}else{
					out.println("<td>One Way</td>");
					//out.println(rs.getString(3));
				}
				
			}else{	
				out.println("<td>"+(rs.getString(i))+"</td>");
			}			
		}
		out.println("</tr>");
	  	}
	  	
	  	%>
  </table> 
  </div>
  </div>
  
      <div class="box-1">
      <p><div class = "login">Cancel Reservation</div></p>
      <div class = "login-align"><br/>
      <form action="cancelReservation.jsp" method="POST">
       Reservation Number: <input type="text" name="res"/> <br/>
       <input type="submit" value="Submit"/>
       </form>
     </div>
    </div>
  
  
  <div class = "box-3">
  <div class = "table-wrap">
     <table class = "sortable">
  		<tr>
	    <th><u>Reservation #</u></th>
	    <th><u>Fare</u></th>
	    <th><u>Trip Type</u></th>
	    <th><u>Depart Time</u></th>
	    <th><u>Origin</u></th>
	   	<th><u>Destination</u></th>
	    <th><u>Transit Line</u></th>
	  	</tr>
	  	
	  	<% 
	  	

	  	
	  	rs = st.executeQuery("SELECT ReservationNumber, Fare, trip, departTime, origin, destination, transitLine FROM  Reservation WHERE canceled = 1 AND Passenger = '"+ session.getAttribute("user") + "';");
	  	
		out.println("<text>Canceled Reservations</text>");
				
	  	while(rs.next()){
	  	out.println("<tr>");
		for(int i = 1; i <= 7; i++){
			
			if(i == 2){
			out.println("<td>$"+(rs.getString(i))+"</td>");
			}else if (i == 3){
				if(rs.getString(i).equals("1")){
					
					out.println("<td>Round Trip</td>");
				}else{
					out.println("<td>One Way</td>");
					//out.println(rs.getString(3));
				}
				
			}else{	
				out.println("<td>"+(rs.getString(i))+"</td>");
			}			
		}
		out.println("</tr>");
	  	}
	  	
	  	%>
  </table> 
  </div>
  </div>
  
      <div class="box-1">
      <p><div class = "login">Ask A Question</div></p>
      <div class = "login-align">
      <form action="question.jsp" method="POST">
       <textarea id="question" name="question" rows="6" cols="60"></textarea>
  		<br>
       <input type="submit" value="Submit"/>
       </form>
     </div>
    </div>

  
    <div class = "box-3">
  <div class = "table-wrap">
     <table class = "sortable">
  		<tr>
	    <th><u>Username</u></th>
	    <th><u>Question</u></th>
	    <th><u>Answer</u></th>
	  	</tr>
	  	
	  	<%
		rs = st.executeQuery("SELECT username, Question, Answer FROM Messages;");
		out.println("<text>Questions</text>");
	  	
		while(rs.next()){
		  	out.println("<tr>");
			for(int i = 1; i <= 3; i++){
				
				if(rs.getString(i).equals("")){
					out.println("<td style = 'color:#990000'><b><u> Question Not Answered</u></b></td>");
				}else{
					out.println("<td>"+(rs.getString(i))+"</td>");
				}
			
			
			}
			
		}
	  	%>
   </table> 
  </div>
  </div>
  
  
  
  <div class="box-1">
      <p><div class = "login">Search Questions By Keyword</div></p>
      <div class = "login-align">
      <form action="searchquestions.jsp" method="POST">
       Keyword: <input type="text" name="keyword"/> <br/>
       <input type="submit" value="Submit"/>
       </form>
     </div>
    </div>
  
  
  
 </body>
 </html>