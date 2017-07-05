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
	int patientid=0;
	String medicinename;
	String severity;
	String bloodgroup;
	String gender;
	String disease;
	String hospital;
	String reactwith;
	int updateQuery =0;
	String sql2;
	reactwith="";
	String visit_date=request.getParameter("visit_date");
	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
	java.util.Date util_visit_date = format.parse(visit_date);
	java.sql.Date sql_visit_date = new java.sql.Date(util_visit_date.getTime());
	patientid=Integer.parseInt(request.getParameter("patientid"));
	medicinename=request.getParameter("medicinename");
	severity=request.getParameter("severity");
	disease=request.getParameter("disease");
	hospital=request.getParameter("hospitalname");
	sql ="SELECT distinct(medicinename) FROM medical_history where patientid="+patientid+" AND medicinename in (SELECT medicinename FROM Medicine where reactionwith LIKE '%"+medicinename+"%')";
	ResultSet rs3 = stmt.executeQuery(sql);
	while(rs3.next())
	{
		if(reactwith=="")
		{
			reactwith=rs3.getString("medicinename");
		}
		else
		{
			reactwith=reactwith+","+rs3.getString("medicinename");
		}
			
	
	}
	
	if(reactwith=="")
	{
	sql = "INSERT INTO medical_history(id,patientid,medicinename,visit_date,disease,severity,hospital) VALUES(null,?,?,?,?,?,?)";
    
	PreparedStatement pstatement = con.prepareStatement(sql);
	pstatement.setInt(1, patientid);
	pstatement.setString(2, medicinename);
	pstatement.setDate(3, sql_visit_date);
	pstatement.setString(4, disease);
	pstatement.setString(5, severity);
	pstatement.setString(6, hospital);
	updateQuery = pstatement.executeUpdate();
	if (updateQuery != 0)
	{
		json.put("result", "success");
		session.setAttribute("msg", "Record Saved Successfully");
	}
	else
	{
		json.put("result", "fail");
	}
	}
	else
	{
		json.put("result", "react");
		json.put("reactlist",reactwith);
		
	}
	response.setContentType("application/json");
    out.print(json);
    out.flush();
	
%>