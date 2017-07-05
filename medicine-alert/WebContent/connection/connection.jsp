<%@page import="java.sql.*"%>
<%
	String db = "medical";
	String user = "root"; 
	java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver"); 
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, user, "root");
	Statement stmt; 
	stmt = con.createStatement();
	

%>