<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.tpo.model.*,com.dts.tpo.dao.*,com.dts.core.util.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AcadamicdetailsAction.jsp' starting page</title>
    
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
   	String target = "index.jsp?status=Invalid username and password"; 
        try{
       Acadamic adto = new Acadamic();
       adto.setLoginname(request.getParameter("loginname"));
       adto.setYearofpass1(Integer.parseInt(request.getParameter("yearofpass1")));
       adto.setPercentage1(Double.parseDouble(request.getParameter("percentage1"))); 
       adto.setYearofpass2(Integer.parseInt(request.getParameter("yearofpass2")));
       adto.setPercentage2(Double.parseDouble(request.getParameter("percentage2")));
       if(request.getParameter("ch")!=null)
       {
           adto.setYearofpass3(Integer.parseInt(request.getParameter("yearofpass3")));
           adto.setPercentage3(Double.parseDouble(request.getParameter("percentage3")));
       }
       else
       {
           adto.setYearofpass3(0);
           adto.setPercentage3(0);
       }
       
       adto.setRollno(request.getParameter("rollno"));
       adto.setYearofjoining(Integer.parseInt(request.getParameter("yearofjoin")));
       adto.setCourse(request.getParameter("course"));
       adto.setDiscipline(request.getParameter("discipline"));
       adto.setSemister(request.getParameter("semister"));
         
       boolean flag = new AcadamicDAO().registerAcadamicDetails(adto);
       
       if(flag)
          target = "studenthome.jsp?status=Welcome "+request.getParameter("loginname");
       }catch(Exception e){
          LoggerManager.writeLogWarning(e);
       }   
      response.sendRedirect(target);
   %>
   
  </body>
</html>
