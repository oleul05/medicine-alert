<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="org.json.simple.*"%>
<%@include file="connection\connection.jsp"%>


<%
	JSONObject json = new JSONObject();
	String sql;
	sql = "SELECT * FROM user where username='" +request.getParameter("username")+"' AND password='"+request.getParameter("password")+"';" ;
	ResultSet rs = stmt.executeQuery(sql);	
	if(rs.next())
		{
			
			session.setAttribute("fname", rs.getString("fname"));
			session.setAttribute("lname", rs.getString("lname"));
			json.put("result", "success");
		}
		else
		{
			json.put("result", "fail");
		}
	response.setContentType("application/json");
    out.print(json);
    out.flush();
%>