<%@ page import="com.dts.tpo.model.*,com.dts.tpo.dao.*,com.dts.core.util.*,java.util.*"%> 
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
.style40 {color: #000000}
-->
</style>
</head>
<body  leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="index_files/BG.gif" bgcolor="silver"><center>
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
            <table width="743" border="0" align="center">
            <tr>
              <td width="737" height="42"><div align="center" class="style25">
                <form name="form1" method="post" action="">
                  <label>
                    <strong>Select Company</strong><strong> </strong>
                    <select name="compid" id="id" onChange="javascript:location.href='ViewRecruitByCompany.jsp?compid='+document.form1.compid.value">
                    <option>--None--</option>                        
                        <%
                        CoreList aCoreList = new CoreList();
                            	CoreHash cCoreHash = new CoreHash();
                         	aCoreList = new CoreList();
                         	cCoreHash = new CoreHash();
                         	try {
                         		NotificationDAO aNotificationdao = new NotificationDAO();
                                cCoreHash = aNotificationdao.getNotifications();
                         		session.setAttribute("notifications", cCoreHash);
                         		if (!cCoreHash.isEmpty()) {
                         			
                         			Notification notification = null;
                         			CoreHash aCoreHash = new CompanyDAO().listCompanies();
									Enumeration enu = aCoreHash.elements();
									Company company = null;
                         			while (enu.hasMoreElements())
                         			 {
                         				company = (Company) enu.nextElement();
                         %><option value="<%=(company.getCompanyID())%>"><%=(company.getCompanyName())%></option> 
                         <%
                          	}
                          		}
                          		}
                          		catch(Exception e)
                          		{
                          		    LoggerManager.writeLogWarning(e);
                          		}
                          	
                          %>
                                                </select>
                    </label>
                </form>
                </div></td>
            </tr>
            <tr>
              <td height="232" valign="top"><form name="f" method="post" action="UpdateStatus.jsp">
               
                  
                        
                          <%
            if(request.getParameter("compid")!=null)
			{
	      
	       cCoreHash = new CoreHash();
	       CoreHash sCoreHash = new CoreHash();
	     try{
             Notification notification = null;
             NotificationDAO aNotificationdao = new NotificationDAO(); 
             cCoreHash =  aNotificationdao.getStudentsByCompany(Integer.parseInt(request.getParameter("compid")));
             
             int notiid = 0;
            
                 //notiid = notification.getNotificationID();
                 
                 String report = ""; 
             	if(!cCoreHash.isEmpty())
          	{
          	    report += "<table width='60%' border='0' align='center'><tr>"+
                    "<td width='289' bgcolor='#FF9600'><div align='center'><strong>Notification ID</strong></div></td>"+
                    "<td width='289' bgcolor='#FF9600'><div align='center'><strong>Date</strong></div></td>"+ 
                    "<td width='289' bgcolor='#FF9600'><div align='center'><strong>Student Name</strong></div></td>"+
                    "<td width='289' bgcolor='#FF9600'><div align='center'><strong>Rollno</strong></div></td>"+
                    "</tr>";
          	%>
                    <span class="style36"> <center>Recruited Students</center> <div align="Right">    <strong> Export to:</strong> <a href="ExportXLS"><strong>XLS</strong> </a></div></span>
                        <table width='60%' border='0' align='center'><tr>
                    <td width='289' bgcolor='#FF9600'><div align='center'><strong>Notification ID</strong></div></td>
                    <td width='289' bgcolor='#FF9600'><div align='center'><strong>Date</strong></div></td>
                    <td width='289' bgcolor='#FF9600'><div align='center'><strong>Student Name</strong></div></td>
                    <td width='289' bgcolor='#FF9600'><div align='center'><strong>Rollno</strong></div></td>
                    </tr>
                  <%
                   Enumeration enu = cCoreHash.elements();
                    Notification aNotification = null;
                    int count = 0; 
                    //CoreHash aCoreHash = new CompanyDAO().listCompanies();
                    while(enu.hasMoreElements())
                    {
                
                        count++;
                         aNotification = (Notification)enu.nextElement();
                        if(aNotification.getStatus().equals("Recruited"))
                        {
                          // Acadamic aAcadamic = new AcadamicDAO().getAcademicDetails(aNotification.getLoginname());
                           report+="<tr><td bgcolor='#FFB76F'><span class='style40'><strong>"+(aNotification.getNotificationID())+"</strong></span></td>"+
                    " <td bgcolor='#FFB76F'><span class='style40'><strong>"+(DateWrapper.parseDate(aNotification.getCreateddate1()))+"</strong></span></td>"+
                    "<td bgcolor='#FFB76F'><span class='style40'><strong>"+(aNotification.getLoginname())+"</strong></span></td>"+
                    "<td bgcolor='#FFB76F'><span class='style40'><strong>"+(aNotification.getRollNo())+"</strong></span></td>"+
                    "</tr>";
                    %>
                    
                  <tr>
                    <td bgcolor="#FFB76F"><span class="style40"><strong><%=(aNotification.getNotificationID())%></strong></span></td>
                    <td bgcolor="#FFB76F"><span class="style40"><strong><%=DateWrapper.parseDate(aNotification.getCreateddate1())%></strong></span></td>
                    <td bgcolor="#FFB76F"><span class="style40"><strong><%=(aNotification.getLoginname())%></strong></span></td>
                    <td bgcolor="#FFB76F"><span class="style40"><strong><%=(aNotification.getRollNo())%></strong></span></td>
                    </tr>
                  <%}} 
                  report+="</table>";
                  session.setAttribute("Reports",report);
                  %>
                   </table>
                   
                <%}
                   else
                   {%>
                    <div align="center" class="style38">
                  No Records Found </div>
               <%} %> 
                      
                        
                      <%}
                catch(Exception e)
                {
                   e.printStackTrace();
                   LoggerManager.writeLogWarning(e);
                }
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