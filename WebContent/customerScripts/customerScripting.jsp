<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="customer.jsp"  method="get">
<%
String grab = request.getParameter("button");
out.println(grab);

if(grab.equals("Arrival Time Ascending")){
	session.setAttribute("bResponse", "1");
	response.sendRedirect("..//customer.jsp");

}else if(grab.equals("Arrival Time Descending")){
	session.setAttribute("bResponse", "2");
	response.sendRedirect("..//customer.jsp");
	
}else if(grab.equals("Departure Time Ascending")){
	session.setAttribute("bResponse", "3");
	response.sendRedirect("..//customer.jsp");
	
}else if(grab.equals("Departure Time Descending")){
	session.setAttribute("bResponse", "4");
	response.sendRedirect("..//customer.jsp");
	
}else if(grab.equals("Fare Price Ascending")){
	session.setAttribute("bResponse", "5");
	response.sendRedirect("..//customer.jsp");
	
}else{
	session.setAttribute("bResponse", "6");
	response.sendRedirect("..//customer.jsp");
}


//response.sendRedirect("..//customer.jsp");

%>
</form>
</body>
</html>