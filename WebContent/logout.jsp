<%
session.getAttributeNames();
session.invalidate();
response.sendRedirect("index.jsp");
%>
