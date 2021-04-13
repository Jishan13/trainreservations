<html>
<body>

<head>
	<title>Sale Reports</title>
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="Images/Tab-Picture.jpg">
</head>

<%@ page import ="java.sql.*" %>
<%

	String monthselected = request.getParameter("month");
	int monthNUM = 0;
	out.println(monthselected);
	
	//(SELECT ReservationNumber, fare, date FROM Reservation Where MONTH(date) = "MONTH HERE")
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs, rs2;

	out.println("Sale Reports<br/>");
    
	 if(monthselected.equals("January")){
	    	monthNUM = 1;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	}
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL
	 
	 if(monthselected.equals("February")){
	    	monthNUM = 2;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("March")){
	    	monthNUM = 3;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL
	 
	 if(monthselected.equals("April")){
	    	monthNUM = 4;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL
	 
	 if(monthselected.equals("May")){
	    	monthNUM = 5;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("June")){
	    	monthNUM = 6;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("July")){
	    	monthNUM = 7;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("August")){
	    	monthNUM = 8;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("September")){
	    	monthNUM = 9;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("October")){
	    	monthNUM = 10;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("November")){
	    	monthNUM = 11;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 if(monthselected.equals("December")){
	    	monthNUM = 12;
	    	rs = st.executeQuery("SELECT ReservationNumber, Passenger, Fare FROM Reservation Where MONTH(departTime) = " + monthNUM + "");
	    	%>
				<div class = "box-3">
				<div class = "table-wrap">
						<table class = "sortable">
								<tr>
									<th><u><b>Reservation ID</b></u></th>
									<th><u><b>Passenger</b></u></th>
									<th><u><b>Total</b></u></th>
								</tr>
	 		<% 
		    	while(rs.next()){
		    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
		    	      out.println("<td>" + (rs.getString(2)) + "</td>");
		    	      out.println("<td>$" + (rs.getDouble(3)) + "</td></tr>");
		    	    }
		    	
		    	out.print("</table>");
		    	out.print("</div>");
	    	%> 
			   		</table>
			   	</div>
		    </div>
		<%  	
	    }//SORT TL

	 %>
	<div class="buttonbox">
		<form action="../admin.jsp" method="POST">
				<button href="#" class="return-button">RETURN TO ADMIN PANEL</button>
		</form>
	</div>


</body>
</html>