<%@ page import="com.dts.tpo.dao.AcadamicDAO,com.dts.tpo.model.Acadamic,com.dts.core.util.DateWrapper" %>
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

<style type="text/css">
<!--
.style38 {color: #FF0000}
.style39 {font-size: 10px}
-->
</style>
</head>
<body  leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="index_files/BG.gif" bgcolor="silver" onLoad="graduatecheck(document.acadamicreg)"><center>
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
    <td><jsp:include page="studentoptions.html"/></td>
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
                  <%
                  	if(request.getParameter("status")!=null)
                  			  {
                  %>
                  <strong><%=request.getParameter("status")%></strong>
                  <%
                  	}
                  %>
              </div></td>
            </tr>
            <tr>
              <td height="232" valign="top">
              <form name="acadamicreg" action="AcadamicUpdateAction.jsp" >
              <%try
              {%>
               <input type="hidden" name="loginname" value="<%=(String)session.getAttribute("user")%>"/>        <%
        	String username=(String)session.getAttribute("user");
                                Acadamic acdto = new AcadamicDAO().getAcademicDetails(username);
        %>
                <table width="296" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                  
                  <tr>
                    <td width="300"><table width="468" border="0" align="center" bgcolor="#FFDBA6">
                      <tr>
                        <td width="149"><span class="style36 style38">SSC</span></td>
                        <td ></td>
                        <td width="75">&nbsp;</td>
                        <td width="144"></td>
                      </tr>
                      <tr>
                        <td class="style36">Year of Passed Out</td>
                        <td ><input type="text" name="yearofpass1" value="<%=acdto.getYearofpass1()  %>"></td>
                        <td width="75" class="style36">Percentage</td>
                        <td width="144">
                          <input type="text" name="percentage1" id="textfield" value="<%=acdto.getPercentage1()%>">
                        </td>
                      </tr>
                      <tr>
                        <td><span class="style36 style38">Under Graduation</span></td>
                        <td><label></label></td>
                        <td>&nbsp;</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td><span class="style36">Year of Passed Out </span></td>
                        <td><label>
                          <input type="text" name="yearofpass2" value="<%=acdto.getYearofpass2()%>">
                            
                        </label></td>
                        <td class="style36">Percentage</td>
                        <td><label>
                          <input type="text" name="percentage2" id="textfield"  value="<%=acdto.getPercentage2()%>">
                        </label></td>
                      </tr>
                      <tr>
                        <td><span class="style36 style38">
                          <input type="checkbox" name="ch" id="checkbox" onClick="graduatecheck(document.acadamicreg)">
                          &nbsp;
                          Graduation</span></td>
                        <td><label></label></td>
                        <td>&nbsp;</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td height="31"><span class="style36">Year of Passed Out </span></td>
                        <td><label>
                          <input type="text" name="yearofpass3" value="<%=acdto.getYearofpass3()%>">
                          
                        </label></td>
                        <td class="style36">Percentage</td>
                        <td><label>
                          <input type="text" name="percentage3"  value="<%=acdto.getPercentage3()%>">
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style36">Roll No (<span class="style39">Present</span>)</td>
                        <td colspan="3"><input type="text" name="rollno" value="<%=acdto.getRollno()%>">                        </td>
                      </tr>
                      <tr>
                        <td><span class="style37"><strong>Year of joining</strong></span></td>
                        <td colspan="3"><label>
                          <input type="text" name="yearofjoin" value="<%=acdto.getYearofjoining()%>">
                          
                        </label></td>
                      </tr>
                      <tr>
                        <td><span class="style37"><strong>Course</strong></span></td>
                        <td colspan="3"><strong>
                          <label>
                          <input type="text" name="course" id="course" value="<%=acdto.getCourse()%>">
                          
                                                    </label>
                        </strong></td>
                      </tr>
                      <tr>
                        <td><span class="style37"><strong>Discipline</strong></span></td>
                        <td colspan="3"><strong>
                          <label>
                         <input type="text" name="discipline" id="discipline"  value="<%=acdto.getDiscipline() %>">
                                                    </label>
                        </strong></td>
                      </tr>
                      <tr>
                        <td><span class="style37"><strong>Semester</strong></span></td>
                        <td colspan="3"><strong>
                          <label>
                          <input type="text" name="semister" id="semister"  value="<%=acdto.getSemister() %>">
                                                   </label>
                        </strong></td>
                      </tr>
                      <tr>
                        <td colspan="4"><div align="center"><br>
                                <input type="submit" name="Submit" value="Update">
                        </div></td>
                      </tr>
                      <tr>
                        <td colspan="4">&nbsp;</td>
                      </tr>
                    </table></td>
                    </tr>
                  <tr>
                    <td height="21" valign="baseline"><div align="center"><img src="images/regisbot.gif" alt="a" width="280" height="3"></div></td>
                    </tr>
                </table>
                <%}
                catch(Exception e){} %>
              </form>             </td>
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