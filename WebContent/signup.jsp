<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String email = request.getParameter("Email");
    String fname = request.getParameter("First Name");
    String lname = request.getParameter("Last Name");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs;
    //ResultSet rs2;
   

    rs = st.executeQuery("select * from Customer where username='" + userid + "'");
    //rs2 = st.executeQuery("select * from Employee where username='" + userid + "'");
    if (rs.next()) {

    	out.println("The username or email you entered is already taken or you left a field blank. Please <a href='login.jsp'>try again</a>");
    	
    } else {

    	st.addBatch("Insert Into Customer Values ('" + userid + "','" + pwd + "','" + fname + "','" + lname + "','" +  email + "')");

        st.executeBatch();
    	//st.executeQuery("Insert Into Customer Values ('test1', 'test2', 'test3', 'test4', 'test5'");
    	out.println("Your account has successfully been made. Please <a href='login.jsp'>Login</a>");
    	
        //out.println("Invalid password or username <a href='login.jsp'>try again</a>");
    }
%>