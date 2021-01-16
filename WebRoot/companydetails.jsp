<%@ page import="com.dts.dae.dao.*,com.dts.dae.model.*,com.dts.core.util.DateWrapper" %>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="JavaScript" src="scripts/general.js"></script>
<script language="javascript">
function validate()
{
   var temp = document.notification;
   if(temp.compname.value=="" || temp.profile.value=="" || temp.novac.value=="" || temp.jobdesc.value=="" ||  temp.location.value=="" ||  temp.desiredskills.value=="" ||  temp.cdate.value=="" || temp.expdate.value=="" ||  temp.desig.value=="" || temp.phone.value=="" || temp.email.value=="" )
   {
       alert("All Fields are manditory");
       return false;
   }
   if(!IsNumeric(temp.noofvac.value))
   {
       alert("Number of vacancies must be numeric");
       return false;
   }
   if(!IsNumeric(temp.phone.value))
   {
       alert("Phone number must be numeric");
       return false;
   }
   return true;
}
</script>

<style type="text/css">
<!--
.style24 {	font-size: 24px;
	font-weight: bold;
}
.style39 {color: #CC856A; font-size: 14px;}
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
    <td><jsp:include page="tpooptions.html"/>
      </td></tr>
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
                  <% if(request.getParameter("status")!=null)
					  {%>
                  <strong><%=request.getParameter("status")%></strong>
                  <%}%>
              </div></td>
            </tr>
            <tr>
              <td height="594" valign="top">
              <form name="notification" action="NotificationAction.jsp" onSubmit="return validate()">
                <table width="379" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                  <tr>
                    <td width="357" height="57" bgcolor="#FF9900"><div align="center" class="style24">N e w &nbsp; Company </div></td>
                    </tr>
                  <tr>
                    <td><table width="394" height="442" border="0" align="center" bgcolor="#FFDBA6">
                        <tr>
                          <td width="114" height="27" class="style36"><span class="style36">Company Name</span></td>
                          <td width="270"><label>
                            <select name="compname" id="select">
                            </select>
                          </label></td>
                        </tr>
                        <tr>
                          <td height="27" class="style36"><span class="style36">Profile</span></td>
                          <td><label>
                            <input type="text" name="profile">
                          </label></td>
                        </tr>
                        <tr>
                          <td height="27" class="style36"><span class="style36">Location</span></td>
                          <td><label>
                            <input type="text" name="location">
                          </label></td>
                        </tr>
                        <tr>
                        <tr>
                          <td height="27" class="style36"><span class="style36">Phone</span></td>
                          <td><label>
                            <input type="text" name="phone">
                          </label></td>
                        </tr>
                        <tr>
                          <td height="27" class="style36"><span class="style36">Email</span></td>
                          <td><label>
                            <input type="text" name="email">
                          </label></td>
                        </tr>

                        <tr>
                          <td height="51" colspan="2">
                            <div align="center">
                              <input type="submit" name="Submit" value="Register">
                                &nbsp;
                                <input name="Input" type="reset" value="Clear">
                            </div></td>
                        </tr>
                    </table></td>
                    </tr>
                  <tr>
                    <td height="21" valign="baseline" bgcolor="#FFDBA6"><div align="center"><img src="images/regisbot.gif" alt="a" width="280" height="3"></div></td>
                    </tr>
                </table>
              </form>
             </td>
            </tr>
          </table>
          </div>
            </td>
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