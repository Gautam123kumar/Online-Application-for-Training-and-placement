<%@ page import="com.dts.dae.dao.ProfileDAO,com.dts.dae.dto.RegistrationBean,com.dts.dae.model.*,com.dts.core.util.DateWrapper" %>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="JavaScript" src="scripts/general.js"></script>
<script language="javascript">
function validate()
{
   var temp = document.updateprofile;
   if(temp.fname.value=="" || temp.lname.value=="" )
   {
       alert("All Fields are manditory");
       return false;
   }
   return true;
}
</script>

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
    <td><jsp:include page="studentoptions.html"/>
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
              <td height="232" valign="top">
              <form name="updateprofile" action="UpdateProfileAction.jsp" onSubmit="return validate()">
                <table width="481" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                  <tr>
                    <td width="471" height="57" bgcolor="#FF9900"><div align="center"><span class="style11">P e r s o n a l D e t a i l s</span></div></td>
                    </tr>
                  <%
                        String username=(String)session.getAttribute("user");
                       Profile rb = new ProfileDAO().getProfile(username);
                        %>                
                  
                  
                  <tr>
                  
                  
                    <td><input name="loginname2" type="hidden" value="<%=rb.getLoginID()%>">
                        <table width="407" border="0" align="center">
                          <tr>
                            <td width="128" class="style36"><span class="style17 style37">First Name </span></td>
                            <td width="269"><label>
                              <input type="text" name="fname" value="<%=rb.getFirstName()%>">
                            </label></td>
                          </tr>
                          <tr>
                            <td class="style36"><span class="style17 style37">Last Name </span></td>
                            <td><label>
                              <input type="text" name="lname" value="<%=rb.getLastName()%>">
                            </label></td>
                          </tr>
                          <tr>
                            <td class="style36"><span class="style17 style37">Birth Date </span></td>
                            <td><label>
                              <input type="text" name="bdate" readonly value="<%=DateWrapper.parseDate(rb.getBirthDate1())%>">
                              <a href="javascript:show_calendar('document.register.bdate', document.register.bdate.value);"> <img src="images/cal.gif" alt="d" width="18" height="18" border="0"/></a> </label></td>
                          </tr>
                          
                          
                          
                                   
                         
                          
                          
                       <tr>
                            <td class="style36"><span class="style17 style37">City</span></td>
                            <td><label>
                              <select name="city">
                                <option>Hyderabad</option>
                                <option>Mumbai</option>
                              </select>
                            </label></td>
                          </tr>
                          <tr>
                            <td class="style36"><span class="style17 style37">State</span></td>
                            <td><label>
                              <select name="state">
                                <option>Andhra pradesh</option>
                                <option>Maharashtra</option>
                              </select>
                            </label></td>
                          </tr>
                          <tr>
                            <td class="style36"><span class="style17 style37">Country</span></td>
                            <td><label>
                              <select name="country">
                                <option>India</option>
                              </select>
                            </label></td>
                          </tr>
                          <tr>
                            <td colspan="2"><div align="center">
                                <input name="Input2" type="submit" value="Update">
                            </div></td>
                          </tr>
                      </table></td>
                    </tr>
                  <tr>
                    <td valign="baseline"><img src="images/regisbot.gif" alt="a" width="465" height="4"></td>
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