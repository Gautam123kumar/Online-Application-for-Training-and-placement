<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.tpo.model.*,com.dts.tpo.dao.*,com.dts.core.util.*,java.util.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'NewTrainingAction.jsp' starting page</title>
    
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
        Training aTraining = new Training();
        aTraining.setTrainingName(request.getParameter("tname"));
        aTraining.setTrainingDate(DateWrapper.parseDate(request.getParameter("tdate")));
        aTraining.setTrainingtime(request.getParameter("ttime"));
        aTraining.setDescription(request.getParameter("tdesc"));
        aTraining.setStatus("Process");
        
        new TrainingDAO().addTraining(aTraining);
     }
     catch(Exception e)
     {
        LoggerManager.writeLogWarning(e);
     }
     response.sendRedirect("ViewTrainings.jsp");
    %>
  </body>
</html>
