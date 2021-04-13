<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Result</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
 <ul>
    <li><a href="customerRep.jsp">Home</a></li>
    <li style = "float:right"><a href="logout.jsp">Logout</a></li>
  </ul>
<%
		String CurrTransitLineName = request.getParameter("CurrentTransitLineName");
		String TransitLineName = request.getParameter("TransitLineName");   
		String Fare = request.getParameter("Fare");   
		String TravelTime = request.getParameter("TravelTime");
		String ArrivalDateTime = request.getParameter("ArrivalDateTime");
		String DepartureDateTime = request.getParameter("DepartureDateTime");	
		String Stops = request.getParameter("Stops");
		String cmd = request.getParameter("command");
		System.out.println(cmd);
	    //out.println("PARSED INFO : " +CurrTransitLineName+"|"+ TransitLineName + " | " + Fare+ " | " + DepartureDateTime + "|"+Stops+"<br/>");
		if(cmd.equals("edit")){
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
	    Statement st = con.createStatement();
	    ResultSet rs,rs1,rs2,rs3;
	    boolean truth = false;
	    rs1 = st.executeQuery("SELECT * FROM TrainSchedule WHERE TransitLineName='"+CurrTransitLineName+"'");
	    if(!rs1.next()){
	    	out.print("Invalid Try");
	    	return;
	    }
	    %>
	    <text>
	    <% 
	    if(CurrTransitLineName.equals("null")||CurrTransitLineName==""){
	    	out.println("Invalid Entries");
	    	return;
	    }%>
	    </text>
	    <%
	    if(TransitLineName==""&&!TransitLineName.equals("null")){
	    	rs2 = st.executeQuery("SELECT * FROM TrainSchedule WHERE TransitLineName ='"+CurrTransitLineName+"'");
	    	boolean exists = rs2.next();
	    	if(Fare!=""&&exists){
	    		truth=true;
	    		String sql = "UPDATE TrainSchedule SET Fare = '"+ Fare+"' where TransitLineName = '" + CurrTransitLineName + "'";
	    	     st.addBatch(sql);
	    	     st.executeBatch();
	    	     System.out.println("In Fare");
	    	}
	    	if(TravelTime!=""&&exists){
	    		truth=true;
	    		String sql = "UPDATE TrainSchedule SET TravelTime = '"+ TravelTime+"'where TransitLineName = '" + CurrTransitLineName + "'";
	   	        st.addBatch(sql);
	   	        st.executeBatch();
	    	}if(ArrivalDateTime!=""&&exists){
	    		truth=true;
	    		String sql = "UPDATE TrainSchedule SET ArrivalDateTime = '"+ ArrivalDateTime+"'where TransitLineName = '" + CurrTransitLineName + "'";
	   	        st.addBatch(sql);
	   	        st.executeBatch();
	    	}if(DepartureDateTime!=""&&exists){
	    		truth=true;
	    		String sql = "UPDATE TrainSchedule SET DepartureDateTime = '"+ DepartureDateTime+"'where TransitLineName = '" + CurrTransitLineName + "'";
	   	        st.addBatch(sql);
	   	        st.executeBatch();
	   	        rs3 = st.executeQuery("SELECT * FROM Reservation WHERE transitLine ='"+CurrTransitLineName+"'");
	   	        if(rs3.next()){
	   	         String UpdateSql = "UPDATE Reservation SET DepartTime='"+ DepartureDateTime+"'where transitLine='"+CurrTransitLineName+"'";
	   	         st.addBatch(UpdateSql);
	   	         st.executeBatch();
	   	        }
	    	}if(Stops!=""&&exists){
	    		truth=true;
	    		String sql = "UPDATE TrainSchedule SET Stops = '"+ Stops+"'where TransitLineName = '" + CurrTransitLineName + "'";
	   	        st.addBatch(sql);
	   	        st.executeBatch();
	    	}
	    	else if(!truth||!exists){%>
	    		<text>Invalid Entry(ies)</text>
	    	<% return;}%>
	    	<text>Update Successful</text>
	    	<h6 style=color:white>Updated Schedule can be found<a href="customerRep.jsp">Here</a></h6>
	    <% }
	    else if(TransitLineName.equals("null")){%>
	    	<text>Null Value Entered</text>
	    <% }
	    else{
	    	rs = st.executeQuery("select * from TrainSchedule where TransitLineName ='"+TransitLineName+"'");
	    	boolean tmp = rs.next();
	      if(tmp){
	       out.print("Invalid Try");
	        }
	      else{
	    	  String sql = "UPDATE TrainSchedule SET TransitLineName = '"+ TransitLineName+"'where TransitLineName = '" + CurrTransitLineName + "'";
	     	  st.addBatch(sql);
	     	  st.executeBatch();
	     	  out.print("Update Successful");
	       }%>
	       </text>
	      <h6 style=color:white>Updated Schedule can be found<a href="customerRep.jsp">Here</a></h6>
	   <% }}else if(cmd.equals("delete")){
	    	Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
		    Statement st = con.createStatement();
		    ResultSet rs;
	    	rs = st.executeQuery("select * from TrainSchedule where TransitLineName ='"+CurrTransitLineName+"'");
	    	 if(rs.next()){
	    		 st.addBatch("DELETE FROM TrainSchedule WHERE TransitLineName = '" +CurrTransitLineName+"'");
	    		 st.executeBatch(); %>
	    		 <text>Deletion was Successful</text>
	    		 <h6 style=color:white>Updated Schedule can be found<a href="customerRep.jsp">Here</a></h6>
	    	<% }else{%>
	    		<text>Deletion Failed</text>
	    	<%}}%>
</body>
</html>