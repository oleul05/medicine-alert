<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
		session.removeAttribute("fname");
		session.removeAttribute("lname");
		String redirectURL = "login.jsp";
		response.sendRedirect(redirectURL);	
%>