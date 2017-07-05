<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.io.*, java.util.Date, java.util.Enumeration" %> 
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="org.json.simple.*"%>
<%@include file="..\connection\connection.jsp"%>
<%
	JSONObject json = new JSONObject();
	
	String sql;
	String pname;
	String address;
	String bloodgroup;
	String gender;
	String disease;
	String hospital;
	int updateQuery =0;
	
	String dob=request.getParameter("dateofbirth");
	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
	java.util.Date util_StartDate = format.parse(dob);
	java.sql.Date sql_StartDate = new java.sql.Date(util_StartDate.getTime());
	
	pname=request.getParameter("patientname");
	address=request.getParameter("address");
	bloodgroup=request.getParameter("bloodgroup");
	gender=request.getParameter("gender");
	disease=request.getParameter("disease");
	hospital=request.getParameter("hospitalname");
	
	sql = "INSERT INTO patient_details(id,patient_name,dob,address,bloodgroup,gender,disease,hospital) VALUES(null,?,?,?,?,?,?,?)";
    
	PreparedStatement pstatement = con.prepareStatement(sql);
	pstatement.setString(1, pname);
	pstatement.setDate(2, sql_StartDate);
	pstatement.setString(3, address);
	pstatement.setString(4, bloodgroup);
	pstatement.setString(5, gender);
	pstatement.setString(6, disease);
	pstatement.setString(7, hospital);
	updateQuery = pstatement.executeUpdate();
	if (updateQuery != 0)
	{
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