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
              <td width="737" height="42"><div align="center" class="style25"></div></td>
            </tr>
            <tr>
              <td height="232" valign="top"><form name="f" method="post" action="DeleteTrainingAction.jsp">
               <%

	      CoreList aCoreList = new CoreList();
	      CoreHash cCoreHash = new CoreHash();
	     try{
             int categoryid = 0;
             int itemid = 0;
             TrainingDAO aTrainingdao = new TrainingDAO(); 
             
             cCoreHash = aTrainingdao.getTrainings();  
             session.setAttribute("trainings",cCoreHash);
             if(!cCoreHash.isEmpty())
          	{%>
                <table width="86%" border="0" align="center">
                  <tr>
                    <td width="20" bgcolor="#FF9600">
                      <input type="checkbox" name="ch" id="checkbox" onClick="SetChecked('ch')">
                    </td>
                    <td width="148" bgcolor="#FF9600"><div align="center"><strong>Name</strong></div></td>
                    <td width="156" bgcolor="#FF9600"><div align="center"><strong>Date</strong></div></td>
                    <td width="124" bgcolor="#FF9600"><div align="center"><strong>Time</strong></div></td>
                    <td width="164" bgcolor="#FF9600"><div align="center"><strong>Status</strong></div></td>
                  </tr>
                  <%
                    Enumeration enu = cCoreHash.elements();
                    Training training = null;
                    while(enu.hasMoreElements())
                    {
                        training = (Training)enu.nextElement();
                    %>
                  <tr>
                    <td bgcolor="#FFB76F"><input type="checkbox" name="ch" id="checkbox2" value="<%=(training.getTrainingid()) %>" onClick="check1()"></td>
                    <td bgcolor="#FFB76F"><div align="center"><span class="style38"><a href="EditTraining.jsp?id=<%=(training.getTrainingid()) %>"><%=(training.getTrainingName()) %> </a></span></div></td>
                    <td bgcolor="#FFB76F"><div align="center"><span class="style38"><%=(DateWrapper.parseDate(training.getTrainingDate1())) %></span></div></td>
                    <td bgcolor="#FFB76F"><div align="center"><span class="style38"><%=(training.getTrainingtime()) %></span></div></td>
                    <td bgcolor="#FFB76F"><div align="center"><span class="style38"><%=(training.getStatus()) %></span></div></td>
                  </tr>
                  <%} %>
                   </table><%}
                   else
                   {%>
                    <div align="center" class="style38">
                  No Records Found </div>
               <%} %> 
                      <div align="center">
                        <input type="button" name="button" id="button" value="Add" onClick="javascript:location.href='NewTraining.jsp'">
                      <% if(!cCoreHash.isEmpty())
         				{%>
                        <input type="submit" name="button2" id="button2" value="Delete">
                      <%}
                       %>  
                      </div>                     
               
               
                 
                  <%
                
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