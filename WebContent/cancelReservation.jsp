<%@ page import ="java.sql.*" %>
<%

 String reservationNum = request.getParameter("res");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
Statement st = con.createStatement();
ResultSet rs;

rs = st.executeQuery("SELECT Passenger FROM Reservation WHERE ReservationNumber = " + reservationNum + ";");

if(rs.next()){
	if(rs.getString(1).equals(session.getAttribute("user"))){
		st.addBatch("UPDATE Reservation SET canceled = 1 WHERE ReservationNumber = " + reservationNum + ";");
		st.executeBatch();
	}	
}

response.sendRedirect("customer.jsp");

%>

