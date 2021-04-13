<%@ page import ="java.sql.*" %>
<%

String question = request.getParameter("question");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
Statement st = con.createStatement();
ResultSet rs;

if("".equals(question)){
	response.sendRedirect("customer.jsp");
}else{

rs = st.executeQuery("SELECT MAX(UniqueNumber) FROM Messages");

int resNum = 0;

if(rs.next() == false){
	out.println("error");
}else{
	resNum = rs.getInt(1) + 1;
}

st.addBatch("INSERT INTO Messages (ssn, username, Question, UniqueNumber, Answer) VALUES ('1', '"  + session.getAttribute("user") + "','" + question + "'," + resNum + ", '');");
st.executeBatch();

response.sendRedirect("customer.jsp");

}

%>