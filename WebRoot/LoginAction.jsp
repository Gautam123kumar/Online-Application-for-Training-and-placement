<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.dae.dao.*,com.dts.dae.model.*,com.dts.dae.dao.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'RegisterAction.jsp' starting page</title>

		
		

	</head>

	<body>
	<jsp:include page="tpooptions.html"/>
	
	
		<br>
		
		<tr>
    <td></td>
  </tr>
	
		<% 
		String target = "index.jsp?status=Invalid username and password";			
		
		
		
		try{
		 Profile  rb=new Profile();
		 String username = request.getParameter("username");
         rb.setLoginID(username);
         rb.setPassword(request.getParameter("password"));
         
         String role=new SecurityDAO().loginCheck(rb);
         
         if(role.equals("tpo"))
         { 
            target = "tpohome.jsp?status=Welcome "+username;
            session.setAttribute("user",username);
            session.setAttribute("role",role);
         } 
         else if(role.equals("student"))
         {
            int status = new SecurityDAO().checkFirstLogin(username);
           if(status==1)
            	target = "studenthome.jsp?status=Welcome "+username;
            else if(status==0)
                target = "acadamicdetails.jsp?loginname="+username;
            else
                target = "LoginForm.jsp?status=Invalid username and password";    	
            session.setAttribute("user",username);
            session.setAttribute("role",role);
         } 
         else  
            target = "LoginForm.jsp?status=Invalid username and password";
            }catch(Exception e){} 
        RequestDispatcher rd = request.getRequestDispatcher(target);
        rd.forward(request,response);    
    %>
	</body>
</html>
