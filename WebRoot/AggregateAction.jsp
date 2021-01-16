<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.dts.core.util.LoggerManager"%>
<%@page import="com.dts.tpo.dao.AggregatesDAO"%>
<%@page import="com.dts.tpo.model.Aggregates"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AggregateAction.jsp' starting page</title>
    
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
        String loginname = request.getParameter("loginname");
        int semister = 0;
        int year = 0;
        double percentage = 0.0; 
        Aggregates aAggregate = null;
    	for(int i=1;i<=8;i++)
    	{
    	    if(request.getParameter("sem"+i)!=null)
            {
    	    	aAggregate = new Aggregates();
    	    	
                aAggregate.setSemister(i);
                aAggregate.setYearOfPass(Integer.parseInt(request.getParameter("sem"+i+"pass")));
                aAggregate.setAggregate(Double.parseDouble(request.getParameter("sem"+i+"per")));
                aAggregate.setLoginName(request.getParameter("loginname"));
                new AggregatesDAO().setAggregate(aAggregate);
            }   
     	}
    }
    catch(Exception e)
    {
       LoggerManager.writeLogWarning(e);
    }
    response.sendRedirect("viewaggregatesinfo.jsp");
    %>
  </body>
</html>
