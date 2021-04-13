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
//out.println("UPDATE");

	String entered_username = request.getParameter("updateusernamechanging");   
	String form_username = request.getParameter("updateusername");   
	String form_pass = request.getParameter("updatepassword");
	String form_fname = request.getParameter("updatefirstname");
	String form_lname = request.getParameter("updatelastname");
	String form_ssn = request.getParameter("updatessn");	
		//out.print("PARSED INFO : " + entered_username + " | " + form_username + " | " + form_pass + " | " + form_ssn + " | " + form_fname + " | " + form_lname + "<br/>");
		
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs, rs2;

    if(form_username == "" ||
       form_pass == "" ||
       form_fname == "" ||
       form_lname == "" ||
       form_ssn == ""){
       out.println("ERROR : An UPDATE was attempted but could not be completed as a field was left blank.<br/>");
    }

	else{
		//Make sure original username is not taken, along with ssn
		//Username found
	    rs = st.executeQuery("select * from Employee where username = '" + entered_username + "' AND customerRep = 1");
			if(rs.next() == true) {
		    	//out.println("Username To Be Changed Was FOUND.<br/>");
		    	rs = st.executeQuery("select * from Employee where username = '" + form_username + "' AND customerRep = 1");
		    	//Username that is being changed to NOT FOUND
		    	if(rs.next() != true){
		    		//out.println("Username To Be Changed To Was NOT FOUND.<br/>");
		    		//out.println("SSN To Be Changed Was NOT In The System.<br/>");
			    	st.addBatch("UPDATE Employee SET ssn = '" + form_ssn + "', FirstName = '" + form_fname + "', LastName = '" + form_lname + 
			    			"', username = '" + form_username + "', password = '" + form_pass + "', admin = 0, customerRep = 1 WHERE username = '" + entered_username + "'");
					st.executeBatch();
					out.println("Employee " + form_fname + " " + form_lname + " was updated.<br/>");
		    	}
		    }
			
			else{
				out.println("ERROR : Username to be changed was NOT found.<br/>");
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