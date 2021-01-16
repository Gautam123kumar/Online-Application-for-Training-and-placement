<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.dts.tpo.model.Skill"%>
<%@page import="com.dts.core.util.LoggerManager"%>
<%@page import="com.dts.tpo.dao.SkillDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SkillAction.jsp' starting page</title>
    
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
        String check = request.getParameter("Submit");
        Skill aSkill = null;
    	for(int i=1;i<=5;i++)
    	{
    	    if(request.getParameter("ch"+i)!=null)
            {
    	    	aSkill = new Skill();
    	    	
                aSkill.setLoginname(request.getParameter("loginname"));
                aSkill.setSkillname(request.getParameter("skillname"+i));
                aSkill.setDescription(request.getParameter("description"+i));
                aSkill.setLevel(request.getParameter("level"+i));
                if(check.equals("Update"))
                	new SkillDAO().updateSkill(aSkill);
                else
                    new SkillDAO().deleteSkill(aSkill);	  
            }   
     	}
    }
    catch(Exception e)
    {
       LoggerManager.writeLogWarning(e);
    }
    response.sendRedirect("viewSkillinfo.jsp");
    %>
  </body>
</html>
