<%@ page import="com.dts.dae.dao.*,com.dts.dae.model.*,com.dts.core.util.*,com.dts.tpo.dao.*,com.dts.tpo.model.*" %>
<%@ page import="java.util.*"%>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="JavaScript" src="scripts/general.js"></script>
<script language="JavaScript" src="scripts/ts_picker.js"></script>
<script language="javascript">
function validate()
{
   var temp = document.notification;
   if(temp.compname.value=="" ||  temp.noofvac.value=="" || temp.jobdesc.value=="" ||  temp.location.value=="" ||  temp.desiredskills.value=="" ||  temp.cdate.value=="" || temp.expdate.value=="" ||  temp.desig.value=="" )
   {
       alert("All Fields are manditory");
       return false;
   }
   if(!IsNumeric(temp.noofvac.value))
   {
       alert("Number of vacancies must be numeric");
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
              <td width="737" height="42"><div align="center" class="style36"><strong>
                  New Notification</strong></div></td>
            </tr>
            <tr>
              <td height="594" valign="top">
              <form name="notification" action="NotificationAction.jsp" onSubmit="return validate()">
                <table width="379" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                  <tr>
                    <td width="357"><table width="394" height="355" border="0" align="center" bgcolor="#FFDBA6">
                        <tr>
                          <td width="114" height="27" class="style36"><span class="style36">Company Name</span></td>
                          <td width="270"><label>
                            <select name="compname" id="select">
                            <%
                                try
                                {
                                     CoreHash cCoreHash = new CompanyDAO().listCompanies();
                                     Enumeration enu = cCoreHash.keys();
                                     int compid = 0;
                                     while(enu.hasMoreElements())
                                     {
                                        compid = ((Integer)enu.nextElement()).intValue();
                                     %>
                                       <option value="<%=(compid)%>"><%=((Company)cCoreHash.get(new Integer(compid))).getCompanyName()%></option>  
                                     <%} 
                                }
                                catch(Exception e)
                                {
                                   LoggerManager.writeLogWarning(e);
                                }
                            
                             %>
                            </select>
                          </label></td>
                        </tr>
                        <tr>
                          <td height="27" class="style36">No of Vacancies</td>
                          <td><label>
                            <input type="text" name="noofvac">
                          </label></td>
                        </tr>
                        <tr>
                          <td height="69" class="style36"><span class="style36">Description</span></td>
                          <td><label>
                            <textarea name="jobdesc" rows="4"></textarea>
                          </label></td>
                        </tr>
                        <tr>
                          <td height="24" class="style36"><span class="style36">Category</span></td>
                          <td><label>
                            <select name="category">
                              <optgroup label="Top Categories"></optgroup>
                              <option>Accounts, Finance, Tax, CS, Audit</option>
                              <option>Banking, Insurance</option>
                              <option>Engineering Design, R&D</option>
                              <option>HR / Administration, IR</option>
                              <option>ITES/BPO/KPO, Customer Service, Ops.</option>
                              <option>Marketing, Advertising, MR, PR</option>
                              <option>Production, Maintenance, Quality</option>
                              <option>Sales, BD</option>
                              <option>Site Engg., Project Management</option>
                              <option>Telecom</option>
                              <optgroup label="IT Software Categories"></optgroup>
                              <option>Application Programming, Maintenance</option>
                              <option>Client Server</option>
                              <option>DBA, Datawarehousing</option>
                              <option>E-Commerce, Internet Technologies</option>
                              <option>Embedded/EDA/VLSI/ASIC/Chip Design</option>
                              <option>ERP, CRM</option>
                              <option>Mainframe</option>
                              <option>Middleware</option>
                              <option>Mobile</option>
                              <option>Network Administration, Security</option>
                              <option>QA & Testing</option>
                              <option>System Programming</option>
                              <option>Systems, EDP, MIS</option>
                              <option>Other</option>
                              <option>Architecture, Interior Design</option>
                              <option>Content, Journalism</option>
                              <optgroup label="More Categories"></optgroup>
                              <option>Corporate Planning, Consulting</option>
                              <option>Export, Import, Merchandising</option>
                              <option>Fashion, Garments, Merchandising</option>
                              <option>Freshers, Trainee Jobs</option>
                              <option>Guards, Security Services</option>
                              <option>Healthcare, Medical, R&D</option>
                              <option>Hotels, Restaurants</option>
                              <option>IT-Support, Telecom, Hardware </option>
                              <option>Legal</option>
                              <option>NGO, Government, Defence Jobs</option>
                              <option>Overseas, International Jobs</option>
                              <option>Packaging</option>
                              <option>Pharma, Biotech</option>
                              <option>Purchase, Logistics, Supply Chain</option>
                              <option>Retailing</option>
                              <option>Secretary, Front Off, Data Entry</option>
                              <option>Self Employed, Consultants</option>
                              <option>Teaching, Education</option>
                              <option>Telecom Software</option>
                              <option>Top Management- IT Jobs</option>
                              <option>Top Management- Non IT Jobs</option>
                              <option>Travel, Ticketing, Airlines</option>
                              <option>TV, Films, Production</option>
                              <option>Web, Graphic Design, Visualiser</option>
                            </select>
                          </label></td>
                        </tr>
                        <tr>
                          <td height="27" class="style36"><span class="style36">Location</span></td>
                          <td><label>
                            <input type="text" name="location">
                          </label></td>
                        </tr>
                        <tr>
                          <td height="27" class="style36"><span class="style36">Desired Skills</span></td>
                          <td><label><input type="text" name="desiredskills">
                            
                          </label></td>
                        </tr>

                        <tr>
                          <td height="27" class="style36"><span class="style36">Created Date</span></td>
                          <td><label>
                            <input type="text" name="cdate" readonly>
                            <a href="javascript:show_calendar('document.notification.cdate', document.notification.cdate.value);"> <img src="images/cal.gif" alt="f" width="18" height="18" border="0"/></a> </label></td>
                        </tr>
                        <tr>
                          <td height="27" class="style36"><span class="style36">Expiry Date</span></td>
                          <td><label>
                            <input type="text" name="expdate" readonly>
                            <a href="javascript:show_calendar('document.notification.expdate', document.notification.expdate.value);"> <img src="images/cal.gif" alt="f" width="18" height="18" border="0"/></a> </label></td>
                        </tr>

                        <tr>
                          <td height="27" class="style36"><span class="style36">Designation</span></td>
                          <td><label>
                            <input type="text" name="desig">
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