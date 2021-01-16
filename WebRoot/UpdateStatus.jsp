<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.dts.core.util.LoggerManager"%>
<%@page import="com.dts.tpo.dao.NotificationDAO"%>
<%@page import="com.dts.tpo.model.Notification"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UpdateStatus.jsp' starting page</title>
    
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
         Notification aNotification = null;
         int count  = Integer.parseInt(request.getParameter("count"));
         String id = "";
         int notiid = 0;
         String loginname = "";
         for(int i=1; i<=count; i++)
         {
             aNotification = new Notification();
             if(request.getParameter("ch"+i)!=null)
             {
              	id = request.getParameter("ch"+i);
              	aNotification.setNotificationID(Integer.parseInt(id.substring(0,id.indexOf("-"))));
              	aNotification.setLoginname(id.substring(id.indexOf("-")+1, id.length()));
              	aNotification.setStatus(request.getParameter("status"+i));
              
      	        new NotificationDAO().updateStatus(aNotification);
            }
         }
     }
     catch(Exception e)
     {
        LoggerManager.writeLogWarning(e);
     }
     response.sendRedirect("ViewNotificationStudents.jsp");
      %>
  </body>
</html>
