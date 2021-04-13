<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
<ul>
    <li><a href="customerRep.jsp">Home</a></li>
    <li><a href="questions.jsp">Pending Questions</a></li>
    <li style = "float:right"><a href="logout.jsp">Logout</a></li>
  </ul>
<%
		String UniqueNumber = request.getParameter("question");
        String Answer = request.getParameter("Answer");
        String user = session.getAttribute("user").toString();
       // out.println(UniqueNumber);out.println(Answer);out.println(user);
 %>
        <text>
        <% if(Answer.equals("null")||Answer==""){
         	out.println("No answer was provided");
         	return;
        }
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
        Statement st = con.createStatement();
	    ResultSet rs;
	    st.addBatch("UPDATE Messages SET Answer='"+Answer+"' WHERE UniqueNumber ='"+UniqueNumber+"'");
	    st.executeBatch();
	     rs = st.executeQuery("SELECT ssn FROM Employee WHERE username = '"+user+"'");
	     if(rs.next()){
	    	 String ssn = rs.getString(1);
	    	st.addBatch("UPDATE Messages SET ssn ='"+ssn+"' WHERE UniqueNumber ='"+UniqueNumber+"'");
	    	st.executeBatch();
	     }
       	%>
       	</text>	
       	<text>Answer Updated</text>
</body>
</html>