<!DOCTYPE html>
<html>
<body>

<head>
	<title>DELETE</title>
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="Images/Tab-Picture.jpg">
</head>

<%@ page import ="java.sql.*" %>
<%
//out.println("DELETE<br/>");

	String form_username = request.getParameter("deleteusername");   
	//out.print("PARSED INFO : " + form_username + "<br/>");

	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs, rs2;

    if(form_username == ""){
    	out.println("ERROR : A DELETE was attempted but could not be completed as the username field was left blank.<br/>");
    }

	else{
	    rs = st.executeQuery("select * from Employee where username = '" + form_username + "' AND customerRep = 1");
	    	//Username is found and could be deleted
			if(rs.next() == true) {
		    	//out.println("Username FOUND.");
		    	st.addBatch("DELETE from Employee WHERE username = '" + form_username + "'");
				st.executeBatch();
				out.println("Username " + form_username + " was successfully deleted.<br/>");
		    }
			else{
				out.println("ERROR : User to be deleted could NOT be found.<br/>");
			}
	}//ELSE
	st.close();
%>
	<div class="buttonbox">
		<form action="../admin.jsp" method="POST">
				<button href="#" class="return-button">RETURN TO ADMIN PANEL</button>
		</form>
	</div>


</body>
</html>
