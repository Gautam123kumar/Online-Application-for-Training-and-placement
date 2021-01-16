<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dts.dae.dao.ProfileDAO,com.dts.dae.model.Profile"%>
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
		String target="userhome.jsp?status=Updation Failed"; 
        try{
		Profile rb = new Profile(); 
        rb.setFirstName(request.getParameter("fname")); 
        rb.setLastName(request.getParameter("lname")); 
        rb.setBirthDate(request.getParameter("bdate")); 
        rb.setHno(request.getParameter("hno"));
        rb.setStreet(request.getParameter("street"));
        rb.setCity(request.getParameter("city")); 
        rb.setState(request.getParameter("state")); 
        rb.setCountry(request.getParameter("country"));
        rb.setPincode(request.getParameter("pincode"));
        rb.setPhoneNo(request.getParameter("phoneno"));
        rb.setEmail(request.getParameter("email")); 
        rb.setLoginID(request.getParameter("loginname")); 
       
        boolean flag=new ProfileDAO().modifyProfile(rb);
        if(flag) 
           target = "studenthome.jsp?status=Updation Success"; 
        else  
            target = "studenthome.jsp?status=Updation Failed"; 
       }catch(Exception e){}
        RequestDispatcher rd = request.getRequestDispatcher(target);
        rd.forward(request,response);    
    %>
	</body>
</html>
