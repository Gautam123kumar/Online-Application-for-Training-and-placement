<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.dae.dao.*,com.dts.dae.model.*,com.dts.core.util.*,com.dts.tpo.model.*,com.dts.tpo.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CompanyAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
     try
     {
        Company aCompany = new Company();
        aCompany.setCompanyID(Integer.parseInt(request.getParameter("cid")));
        aCompany.setCompanyName(request.getParameter("compname"));
        aCompany.setProfile(request.getParameter("profile"));
        aCompany.setStreet(request.getParameter("street"));
        aCompany.setCity(request.getParameter("city"));
        aCompany.setState(request.getParameter("state"));
        aCompany.setCountry(request.getParameter("country"));
        aCompany.setPhone(request.getParameter("phone"));
        aCompany.setEmail(request.getParameter("email"));
        
        new CompanyDAO().updateCompany(aCompany);
        
     }
     catch(Exception e)
     {
       LoggerManager.writeLogWarning(e);
     }
     response.sendRedirect("ViewCompanies.jsp");
    %>
  </body>
</html>
