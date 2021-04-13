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
//out.println("ADD<br/>");
	
	//Information Entered IN THE FORM Of The Add Request
	String form_username = request.getParameter("addusername");   
	String form_pass = request.getParameter("addpassword");
	String form_fname = request.getParameter("addfirstname");
	String form_lname = request.getParameter("addlastname");
	String form_ssn = request.getParameter("addssn");	
		//out.print("PARSED INFO : " + form_username + " | " + form_pass + " | " + form_ssn + " | " + form_fname + " | " + form_lname + "<br/>");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs, rs2;
	
	//When adding a user, all fields must be filled
	if(form_username == "" ||
		form_pass == "" ||
		form_fname == "" ||
		form_lname == "" ||
		form_ssn == ""){	
		out.println("ERROR : An ADD was attempted but could not be completed as a field was left blank.<br/>");
	}
    
	else{
		    //Make sure username is not taken if it is being added
		    rs = st.executeQuery("select * from Employee where username ='" + form_username + "'");
				if(rs.next() == true) {
			    	out.println("ERROR : The username entered is already taken and cannot be added.<br/>");
			    }
				else{
					out.println("User " + form_fname + " " + form_lname + " was added as a Customer-Representative.<br/>");
					//out.println("QUERY : Insert into Employee values ('" + form_ssn + "','" + form_fname + "','" + form_lname + "','" + form_username + "','" +  form_pass + "'," +  0 + "," +  1 + ")<br/>");
					st.addBatch("Insert Into Employee Values ('" + form_ssn + "','" + form_fname + "','" + form_lname + "','" + form_username + "','" +  form_pass + "'," +  0 + "," +  1 + ")");
					st.executeBatch();
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