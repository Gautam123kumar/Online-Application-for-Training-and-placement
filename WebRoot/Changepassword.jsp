<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="javascript">
function validate()
{
   if(document.changepassword.username.value=="" || document.changepassword.oldpassword.value=="" || document.changepassword.newpassword.value=="")
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
	font-size: 18px
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
    <td><%if((request.getParameter("role")).equals("tpo")) 
                {%>
                	<jsp:include page="tpooptions.html"/>
                <%}
                else if((request.getParameter("role")).equals("student")) 
                {%>
                    <jsp:include page="studentoptions.html"/>
               <% }
                 %>	</td>
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
                  <p>
                    <% if(request.getParameter("status")!=null)
					  {%>
                      <strong><%=request.getParameter("status")%></strong>
                      <%}%>
                  </p>
                  <p class="style36 style38"><strong>Change Password    </strong></p>
              </div></td>
            </tr>
            <tr>
              <td height="232" valign="top">
              <form name="changepassword" action="ChangepasswordAction.jsp" onSubmit="return validate()">
              <table width="314" height="178" border="0" align="center" bordercolor="#FF9900" bgcolor="#FFDBA6">
                  
                  <tr>
                    <td width="287" height="120"><table width="296" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                      
                      <tr>
                        <td width="300"><table width="261" border="0" align="center">
                            <tr>
                              <td width="106" class="style36">User Name</td>
                              <td width="145"><label>
                                <input type="text" name="username" emsg="Username is required">
                              </label></td>
                            </tr>
                            <tr>
                              <td class="style36">Old Password</td>
                              <td><label>
                                <input type="password" name="oldpassword" emsg="Password is required">
                              </label></td>
                            </tr>
                            <tr>
                              <td class="style36">New Password </td>
                              <td><label>
                                <input type="password" name="newpassword" emsg="Password is required">
                              </label></td>
                            </tr>
                            <tr>
                              <td colspan="2"><label>
                                  <div align="center">
                                    <input type="submit" name="Submit" value="Change">
                                    &nbsp;
                                    <input type="reset" name="Submit2" value="Reset">
                                  </div>
                                </label></td>
                            </tr>
                        </table></td>
                        </tr>
                      <tr>
                        <td height="21" valign="baseline"><div align="center"><img src="images/regisbot.gif" alt="a" width="280" height="3"></div></td>
                        </tr>
                    </table></td>
                    </tr>
              </table>
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