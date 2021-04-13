<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Customer where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next() == false || userid.equals("") || pwd.equals("")) {
    	
    	rs = st.executeQuery("select * from Employee where username='" + userid + "' and password='" + pwd + "'");
    	if(rs.next() == true){
    		if(Integer.parseInt(rs.getString(6)) == 1){
    			session.setAttribute("user", userid);
    			session.setAttribute("type", "admin");
    	        response.sendRedirect("index.jsp");
    		}else{
    			session.setAttribute("user", userid);
    			session.setAttribute("type", "customerRep");
    	        response.sendRedirect("index.jsp");
    		}
    	}else{
        	out.println("Invalid password or username <a href='login.jsp'>try again</a>");
    	}
        		
        		
        		
    } else {
        session.setAttribute("user", userid);
        session.setAttribute("type", "customer");
        response.sendRedirect("index.jsp");
    }
%>