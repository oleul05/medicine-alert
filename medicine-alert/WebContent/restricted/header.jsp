<%
		if (session.getAttribute("fname")==null)
		{
			String redirectURL = "../login.jsp";
			response.sendRedirect(redirectURL);	
		}
	
%>