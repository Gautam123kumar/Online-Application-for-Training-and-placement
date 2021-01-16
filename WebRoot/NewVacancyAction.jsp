<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dts.tpo.dao.*,com.dts.tpo.model.*,com.dts.dae.dao.*,com.dts.core.util.*"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'RegisterAction.jsp' starting page</title>

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
		<br>
		<%
			
				try{
			    Notification notidto = new Notification();
				
				notidto.setCompanyID(Integer.parseInt("compid")); 
				notidto.setNoofvac(request.getParameter("noofvac"));
				notidto.setJobdesc(request.getParameter("jobdesc"));
				notidto.setCategory(request.getParameter("category"));
				notidto.setLocation(request.getParameter("location"));
				notidto.setDesiredskills(request.getParameter("desiredskills"));
				notidto.setCreateddate(DateWrapper.parseDate(request.getParameter("cdate")));
				notidto.setExpirydate(DateWrapper.parseDate(request.getParameter("expdate")));
				notidto.setDesignation(request.getParameter("desig"));
				notidto.setStatus("Process");
				
				new NotificationDAO().registerNotification(notidto);
		       
		        }
		        catch(Exception e)
		        {
		           LoggerManager.writeLogWarning(e);
		        } 
		    response.sendRedirect("ViewNotification.jsp");
		%>
	</body>
</html>
