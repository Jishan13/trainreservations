<html>
<body>

<head>
	<title>Reservations</title>
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="Images/Tab-Picture.jpg">
</head>

<%@ page import ="java.sql.*" %>
<%
//out.println("SHOW RESERVATIONS<br/>");

	//Information Entered IN THE FORM Of The Revenue Request
	String sorttype = request.getParameter("sort2");
	//out.println("|" + sorttype + "|" + "<br/>");
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs, rs2;
    
    if(sorttype.equals("searchTL")){
    	out.println("Reservations Sorted By Transit Line<br/>");
    	
    	rs = st.executeQuery("SELECT TransitLineName, ReservationNumber FROM Planned ORDER BY TransitLineName ASC");
    	%>
			<div class = "box-3">
			<div class = "table-wrap">
					<table class = "sortable">
							<tr>
								<th><u><b>Transit Line Name</b></u></th>
								<th><u><b>Reservation Number</b></u></th>
							</tr>
 		<% 
	    	while(rs.next()){
	    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
	    	      out.println("<td>" + (rs.getInt(2)) + "</td></tr>");
	    	    }
	    	
	    	out.print("</table>");
	    	out.print("</div>");
    	%> 
		   		</table>
		   	</div>
	    </div>
	<%    	
    }//SORT TL
    
    else if(sorttype.equals("searchCN")){
    	out.println("Reservations Sorted By Customer Name<br/>");
	    	
    	rs = st.executeQuery("SELECT Passenger, ReservationNumber FROM Reservation ORDER BY Passenger, ReservationNumber ASC");
    	%>
			<div class = "box-3">
			<div class = "table-wrap">
					<table class = "sortable">
							<tr>
							<th><u><b>Customer Name</b></u></th>
							<th><u><b>Reservation Number</b></u></th>
							</tr>
 		<% 
	    	while(rs.next()){
	    	      out.println("<tr><td>" + (rs.getString(1)) + "</td>");
	    	      out.println("<td>" + (rs.getInt(2)) + "</td></tr>");
	    	    }
	    	
	    	out.print("</table>");
	    	out.print("</div>");
    	%> 
		   		</table>
		   	</div>
	    </div>
	<%    		
	}//SORT CN
   
%>
	<div class="buttonbox">
		<form action="../admin.jsp" method="POST">
				<button href="#" class="return-button">RETURN TO ADMIN PANEL</button>
		</form>
	</div>


</body>
</html>