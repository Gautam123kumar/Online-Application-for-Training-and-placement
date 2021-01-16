<%@ page import="com.dts.tpo.model.*,com.dts.tpo.dao.*,com.dts.core.util.*,java.util.*,com.dts.dae.dao.*,com.dts.dae.model.*"%> 
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="JavaScript" src="scripts/general.js"></script>
<script language="javascript">
function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
</script>
<style type="text/css">
<!--
.style38 {
	color: #000000;
	font-weight: bold;
}
.style41 {color: #000000; font-weight: bold; font-size: x-small; }
.style42 {
	font-size: 10px;
	color: cc0033;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	text-decoration: none;
}
.style48 {
	text-decoration: none;
	color: cc0033;
	font-weight: bold;
}
.style49 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body  leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="index_files/BG.gif" bgcolor="silver" onLoad="fillcourse(document.acadamic)"><center>
<table style="width: 778px;" background="" border="0" cellpadding="0" cellspacing="0" width="778">
  <tbody>
  
  <tr>
    <td align="left" valign="top">
      <table style="width: 778px; height: 20px;" background="index_files/SEP_002.gif" border="0" cellpadding="0" cellspacing="0" height="20" width="778">
        
        <tbody><tr>
          <td style="width: 535px; height: 20px;" class="nlink" align="left" height="20" valign="middle" width="535">
<jsp:include page="scroll.html"/></td>
          <td style="width: 30px;" align="right" valign="bottom" width="30">
          <img style="width: 20px; height: 20px;" alt="" src="index_files/CMB.gif" border="0" height="20" hspace="0" width="20"></td>
          <td style="width: 213px; height: 20px;" align="left" bgcolor="#ff9900" height="20" valign="center" width="213">&nbsp;</td>
        </tr></tbody></table></td></tr>
  <tr>
    <td align="left" valign="top">
      <table style="height: 80px;" bgcolor="ivory" border="0" cellpadding="0" cellspacing="0" height="80" width="778">
        
        <tbody><tr>
          <td align="left" valign="top"><img src="index_files/BANNER.gif" width="778" height="80" border="0" style="width: 778px; height: 80px;"></td>
        </tr></tbody></table></td></tr>
  <tr>
    <td><jsp:include page="tpooptions.html"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">
      <table bgcolor="#ff9900" border="0" cellpadding="0" cellspacing="0" width="778">
        <tbody>
        
        <tr>
          <td width="14"></td>
          <td width="751" height="391" align="center" valign="top" background="index_files/BG.gif" bgcolor="#ff9900" style="width: 190px;"><div align="center">
            <table width="677" border="0" align="center">
            <tr>
              <td width="1209" height="42"><div align="center" class="style25"><strong>Student Details</strong></div></td>
            </tr>
            <tr>
              <td height="232" valign="top">
              <form name="acadamic" method="post" action="ViewStudents.jsp">
                <div align="center"><table width="640" border="0">
                    <!--<tr>
                      <td width="49" height="33" class="style25"><strong>Course</strong></td>
                      <td width="117"><select name="course" id="course" onChange="getdiscipline(document.acadamic)">
                      </select></td>
                      <td width="74" class="style25"><strong>Discipline 
                        </strong></td>
                      <td width="184">                       
                         <select name="discipline" id="discipline">
                      </select></td>
                      <td width="59" class="style25"><strong>Semester</strong></td>
                      <td width="131">                        
                      <select name="semister" id="semister">
                      </select></td>
                    </tr>
                    --><tr>
                      <!--<td colspan="6"><label>
                        <div align="center">
                          <input type="submit" name="search" id="button3" value="Search">
                          </div>
                      </label></td>
                      --></tr>
                  </table>
                </div>
                  
                    <%
                  
	      CoreList aCoreList = new CoreList();
	      CoreHash cCoreHash = new CoreHash();
	     try{
             int categoryid = 0;
             int itemid = 0;
             AcadamicDAO aAcadamicdao = new AcadamicDAO(); 
             
             cCoreHash = aAcadamicdao.getProfile("student"); 
             session.setAttribute("studentProfiles",cCoreHash);
            /* if(request.getParameter("search")!=null)
             { 
                 cCoreHash = aAcadamicdao.getProfile(request.getParameter("course"),request.getParameter("discipline"),request.getParameter("semister"));
             }*/
             if(!cCoreHash.isEmpty())
          	{%>
                      <span class="style49"><blink>*</blink></span><span class="style41">For Acadamics click on Name</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <span class="style42"><span class="style49"><blink>*</blink></span></span><span class="style41">For Current Aggregates Click on Descipline</span>                  
                  <table width="93%" border="0" align="center">
                  <tr>
                    <td width="123" bgcolor="#FF9600"><div align="center"><strong>Roll No</strong></div></td>
                   
                      <td width="123" bgcolor="#FF9600"><div align="center"><strong>Student Name</strong></div></td>
                    <td width="130" bgcolor="#FF9600"><div align="center"><strong>Course</strong></div></td>
                    <td width="140" bgcolor="#FF9600"><div align="center"><strong>Descipline</strong></div></td>
                    <td width="183" bgcolor="#FF9600"><div align="center"><strong>Semister</strong></div></td>
                  </tr>
                  <%
                    Enumeration enu = cCoreHash.elements();
                    Acadamic aAcadamic = null; 
                    CoreHash aCoreHash = new CompanyDAO().listCompanies();
                    while(enu.hasMoreElements())
                    {
                        aAcadamic = (Acadamic)enu.nextElement();

                    %>
                    
                    
                    
                    
                    <%
                  String userId = request.getParameter("id");
                  Acadamic userDetails = new AcadamicDAO().getAcademicDetails(userId);
               
                %>
                    
                    
                    
                  <tr>
                    <td bgcolor="#FFB76F"><div align="center" class="style38"><%=(aAcadamic.getRollno()) %></div></td>
                    
                    <td bgcolor="#FFB76F"><div align="center" class="style38"><a target="_blank" href="ViewAcadamic.jsp?id=<%=(aAcadamic.getLoginname())%>"><%=(aAcadamic.getLoginname())%> </a></div></td>
                    <td bgcolor="#FFB76F"><div align="center" class="style38"><%=(aAcadamic.getCourse()) %></div></td>
                    <td bgcolor="#FFB76F"><div align="center" class="style38"><a target="_blank" href="ViewAcadamic.jsp?id=<%=(aAcadamic.getLoginname())%>"><%=(aAcadamic.getDiscipline()) %></a></div></td>
                    <td bgcolor="#FFB76F"><div align="center" class="style38"><%=(aAcadamic.getSemister())%></div></td>
                  </tr>
                  <%} %>
                   </table>
                <%}
                   else
                   {%>
                    <div align="center" class="style38">
                  No Records Found </div>
               <%} %><!-- 
                      <div align="center">
                        <input type="button" name="button" id="button" value="Add" onClick="javascript:location.href='NewNotification.jsp'">
                      <% if(!cCoreHash.isEmpty())
         				{%>
                        <input type="submit" name="button2" id="button2" value="Delete">
                      <%}
                       %>  
                      </div>
                  --><%
                }
                catch(Exception e)
                {
                   LoggerManager.writeLogWarning(e);
                } %>
              </form>
              </td>
            </tr>
          </table>
          </div>            </td>
          <td width="13"></td>
        </tr>
        <tr>
          <td height="19" colspan="3" align="left" valign="top" bgcolor="#ff9900" style="width: 190px;">&nbsp;</td>
          </tr>
      </tbody></table></td></tr>
  <tr>
    <td align="left" valign="top">&nbsp;    </td>
  </tr>
  <tr>
    <td><img style="width: 503px; height: 4px;" alt="" src="index_files/TOP.gif" height="5" width="15"></td>
  </tr>
  </tbody></table>
</body></html>