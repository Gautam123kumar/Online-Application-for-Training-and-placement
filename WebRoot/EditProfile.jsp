<%@ page import="com.dts.core.model.*,com.dts.tpo.model.*,com.dts.tpo.dao.*,com.dts.dae.dao.*,com.dts.dae.model.*" %>
<%@page import="com.dts.core.util.DateWrapper"%>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="JavaScript" src="scripts/ts_picker.js"></script>
<script language="JavaScript" src="scripts/general.js"></script>
<script language="javascript">
function validate()
{
   var temp = document.register;
   if(temp.fname.value=="" || temp.lname.value=="" || temp.bdate.value=="" || temp.loginname.value=="" || temp.password.value=="" || temp.sanswer.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   if(temp.ch.checked && temp.ownquest.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   return true;
}
</script>
</head>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="index_files/BG.gif" bgcolor="silver">
<center>
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
              <form action="UpdateProfileAction.jsp" name="register" onSubmit="return validate()">
              <input type="hidden" name="loginname" value="<%=(String)session.getAttribute("user")%>"/>        <%
        	String loginname=(String)session.getAttribute("user");
                                Profile profiledto = new ProfileDAO().getProfile(loginname);
        %>
              <table width="481" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                
                <tr>
                  <td width="471"><table width="407" border="0" align="center">
                      <tr>
                        <td width="128"><span class="style36">First Name </span></td>
                        <td width="269"><label>
                          <input type="text" name="fname" value="<%=profiledto.getFirstName() %>">
                        </label></td>
                      </tr>
                      <tr>
                        <td><span class="style36">Last Name </span></td>
                        <td><label>
                          <input type="text" name="lname" value="<%=profiledto.getLastName()%>">
                        </label></td>
                      </tr>
                      <tr>
                        <td><span class="style36">Birth Date </span></td>
                        <td><label>
                          <input type="text" name="bdate" readonly  value="<%=DateWrapper.parseDate(profiledto.getBirthDate1())%>">
                          <a href="javascript:show_calendar('document.register.bdate', document.register.bdate.value);"> <img src="images/cal.gif" alt="f" width="18" height="18" border="0"/></a> </label></td>
                      </tr>
                      <tr>
                        <td class="style36">Hno</td>
                        <td><input name="hno" type="text" id="hno"  value="<%=profiledto.getHno()%>"></td>
                      </tr>
                      <tr>
                        <td class="style36">Street</td>
                        <td><input name="street" type="text" id="street"  value="<%=profiledto.getStreet()%>"></td>
                      </tr>
                      <tr>
                        <td><span class="style36">City</span></td>
                        <td><label>
                          <select name="city">
                            <option>Hyderabad</option>
                              <option>lacknow</option>
                            <option>Mumbai</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td><span class="style36">State</span></td>
                        <td><label>
                          <select name="state">
                            <option>Andhra pradesh</option>
                            <option>Maharashtra</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td><span class="style36">Country</span></td>
                        <td><label>
                          <select name="country">
                            <option>India</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style36">Pincode</td>
                        <td><input name="pincode" type="text" id="pincode"  value="<%=profiledto.getPincode()%>"></td>
                      </tr>
                      <tr>
                        <td class="style36">Phone No</td>
                        <td><input type="text" name="phoneno"  value="<%=profiledto.getPhoneNo()%>"></td>
                      </tr>
                      <tr>
                        <td class="style36">Email</td>
                        <td><input name="email" type="text" id="email"  value="<%=profiledto.getEmail()%>"></td>
                      </tr>
                      <tr>
                        <td colspan="2"><div align="center">
                            <input name="Input" type="submit" value="Update">&nbsp;&nbsp;
                        </div></td>
                      </tr>
                  </table></td>
                  </tr>
                <tr>
                  <td valign="baseline"><img src="images/regisbot.gif" alt="a" width="465" height="4"></td>
                  </tr>
              </table>  
              </form>            
              <p align="center">&nbsp;</p></td>
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