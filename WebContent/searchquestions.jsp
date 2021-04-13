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
    String keyword = request.getParameter("keyword");   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs;
     %>
    
  <div class = "box-3">
  <div class = "table-wrap">
     <table class = "sortable">
  		<tr>
	    <th><u>Username</u></th>
	    <th><u>Question</u></th>
	    <th><u>Answer</u></th>
	  	</tr>
	  	
	  	<%
		rs = st.executeQuery("SELECT username, Question, Answer FROM Messages WHERE Question LIKE '%" + keyword + "%';");
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
    
    
    
    
</body>
</html>