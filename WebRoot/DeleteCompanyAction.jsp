
<%@ page import="com.dts.tpo.dao.*,com.dts.core.util.LoggerManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DeleteBrandAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
     <%
     String target="ViewCompanies.jsp";
      try{
            CompanyDAO aCompanydao = new CompanyDAO();
            String ch[] = request.getParameterValues("ch");
            
            for(int i=1;i<ch.length;i++)
            {
                aCompanydao.deleteCompany(Integer.parseInt(ch[i]));  
            }
         }
         catch(Exception e)
         {
           LoggerManager.writeLogWarning(e);
         }
         response.sendRedirect(target);
            
    
    
     %>
  </body>
</html>
