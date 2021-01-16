<%@ page import="com.dts.tpo.model.*,com.dts.tpo.dao.*,com.dts.core.util.*,java.util.*,com.dts.dae.dao.*,com.dts.dae.model.*"%> 
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="JavaScript" src="scripts/general.js"></script>
<script language="javascript">
function SetChecked(ch) {
  if(document.acadamic.ch[0].checked){ 
    for( i=0 ; i<document.acadamic.ch.length ; i++) {
		if (document.acadamic.ch[i].name==ch) {
		document.acadamic.ch[i].checked=true;
		}
	}}else{
	 for( i=0 ; i<document.acadamic.ch.length ; i++) {
		if (document.acadamic.ch[i].name==ch) {
		document.acadamic.ch[i].checked=false; 
		}  	}}
}
function check1() {
var flag = false;
  for( i=1 ; i<document.acadamic.ch.length ; i++) {
		if (document.acadamic.ch[i].checked) {
		    document.acadamic.ch[0].checked=true;
		    flag = true;
		    break;
		}
	}
  if(!flag){
	   document.acadamic.ch[0].checked=false; 
	}
}
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
.style39 {color: #000000}
-->
</style>
</head>
<body  leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="index_files/BG.gif" bgcolor="silver" onLoad="fillcourse(document.acadamic)"><center>
<%
if(request.getParameter("button")!=null)
{
if(request.getParameter("button").equals("Assign to Notification"))
{
    String ch[] = request.getParameterValues("ch");
    int notiid = Integer.parseInt(request.getParameter("notiid"));
    String rollno = "0";
    String loginname = "";
    for(int i=1;i<ch.length;i++)
    {
       loginname = ch[i].substring(0,ch[i].indexOf("-"));
       rollno = (ch[i].substring(ch[i].indexOf("-")+1,ch[i].length()));
       new NotificationDAO().addToNotification(loginname,notiid,rollno); 
    }   
}
}
 %>
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
            <table width="751" border="0" align="center">
           
            <tr>
              <td height="398" valign="top">
              <form name="acadamic" method="post" action="SearchStudents.jsp">
              <%
             	 String course = "BTech";
                 String discipline = "Electronics";
                 String semister = "First";
                 String per = "0";
              	if(request.getParameter("course")!=null)
                            		{
                            		   course = request.getParameter("course");
                            		   discipline = request.getParameter("discipline");
                            		   semister = request.getParameter("semister");
                            		   per = request.getParameter("aggregate");
                            		}
               %>
                <div align="center"><table width="742" border="0">
                    <tr>
                      <td width="116" height="24" bgcolor="#FFB66B" class="style25"><span class="style38">Course</span></td>
                      <td width="197">
                      <input type="hidden" name="course1" value="<%=course %>"/> 
                      <select name="course" id="course" onChange="getdiscipline(document.acadamic)">
                      
                      </select></td>
                      <td width="415" rowspan="14" valign="top"><%
                            	CoreList aCoreList = new CoreList();
                            	CoreHash cCoreHash = new CoreHash();
                            	 
                            	try {
                            		AcadamicDAO aAcadamicdao = new AcadamicDAO();

                            		cCoreHash = aAcadamicdao.getProfile("student");
                            		session.setAttribute("studentProfiles", cCoreHash);
                            		if (request.getParameter("search") != null) 
                            		{
                            			cCoreHash = aAcadamicdao.getProfile(request
                            					.getParameter("course"), request
                            					.getParameter("discipline"), request
                            					.getParameter("semister"), request.getParameter("aggregate"));
										%>
										<strong><center><%=course%> | <%=discipline%> | <%=semister%> Semister</strong>
										<br/>
								        <%		 
                            		}
                            		if (!cCoreHash.isEmpty()) 
                            		{
                            %>
                        
                      <table width="100%" border="0" align="center">
                        <tr>
                          <td width="20" bgcolor="#FF9600"><label>
                            <input type="checkbox" name="ch" id="ch" onclick="SetChecked('ch')">
                          </label></td>
                          <td width="112" bgcolor="#FF9600"><div align="center"><strong>Roll No</strong></div></td>
                          <td width="134" bgcolor="#FF9600"><div align="center"><strong>Student Name</strong></div></td>
                          <td width="88" bgcolor="#FF9600"><div align="center"><strong>Percentage</strong></div></td>
                          </tr>
                        <%
                        	Enumeration enu = cCoreHash.elements();
                        			Acadamic aAcadamic = null;
                        			CoreHash aCoreHash = new CompanyDAO().listCompanies();
                        			while (enu.hasMoreElements()) {
                        				aAcadamic = (Acadamic) enu.nextElement();
                        %>
                        <tr>
                          <td bgcolor="#FFB76F"><input type="checkbox" name="ch" id="ch" onclick="check1()" value="<%=(aAcadamic.getLoginname())%>-<%=aAcadamic.getRollno()%>"></td>
                          <td bgcolor="#FFB76F"><div align="center" class="style38"><%=(aAcadamic.getRollno())%></div></td>
                          <td bgcolor="#FFB76F"><div align="center" class="style38"><a target="_blank" href="ViewAcadamic.jsp?id=<%=(aAcadamic.getLoginname())%>"><%=(aAcadamic.getLoginname())%> </a></div></td>
                          <td bgcolor="#FFB76F"><div align="center" class="style38"><%=(aAcadamic.getAggregate())%></div></td>
                          </tr>
                        <%
                        	}
                        %>
                      </table> <label>
                      <div align="center">
                        <input type="submit" name="button" id="button" value="Assign to Notification">
                      </div>
                      </label> <%
 	} else {
 %>
                     
                      <div align="center" class="style38">
                  No Records Found </div>
               <%
               	}
               	} catch (Exception e) {

               	}
               %></td>
                    </tr><tr>
                      <td width="116" bgcolor="#FFB66B" class="style25"><span class="style38">Descipline 
                        </span></td>
                      <td width="197">                       
                      <input type="hidden" name="discipline1" value="<%=discipline%>"/>
                         <select name="discipline" id="discipline">
                          <option><%=discipline %></option>
                      </select></td>
                      </tr><tr>
                      <td width="116" bgcolor="#FFB66B" class="style25"><span class="style38">Semister</span></td>
                      <td width="197">
                      <input type="hidden" name="semister1" value="<%=semister%>"/>                        
                      <select name="semister" size="1" id="semister">
                       
                      </select></td>
                      </tr>
                      <tr>
                      <td width="116" bgcolor="#FFB66B" class="style25"><span class="style38">Aggregate</span></td>
                      <td width="197">                        
                      <input type="text" name="aggregate" value="<%=per%>"/></td>
                      </tr>
                      <tr>
                        <td height="5" class="style25 style39"></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td height="6" colspan="2" class="style25">
                          <div align="center">
                            <input type="submit" name="search" id="search" value="Search">
                            </div>
                       </td>
                        </tr>
                      <tr>
                        <td height="31" bgcolor="#FFB66B" class="style36 style39">Notification ID</td>
                        <td><select name="notiid" id="id" onChange="javascript:location.href='SearchStudents.jsp?search=Search&notiid='+document.acadamic.notiid.value+'&course='+document.acadamic.course1.value+'&discipline='+document.acadamic.discipline1.value+'&semister='+document.acadamic.semister1.value+'&aggregate='+document.acadamic.aggregate.value">
                        
                        <%
                          if(request.getParameter("notiid")!=null)
                          {
                         %>
                        <option value="<%=request.getParameter("notiid")%>"><%=request.getParameter("notiid")%></option>
                         <%
                            }
                            else
                            {%>
                            <option>--None--</option>
                            <%}
                         	aCoreList = new CoreList();
                         	cCoreHash = new CoreHash();
                         	try {
                         		int categoryid = 0;
                         		int itemid = 0;
                         		NotificationDAO aNotificationdao = new NotificationDAO();

                         		cCoreHash = aNotificationdao.getNotifications();
                         		session.setAttribute("notifications", cCoreHash);
                         		if (!cCoreHash.isEmpty()) {
                         			Enumeration enu = cCoreHash.elements();
                         			Notification notification = null;
                         			CoreHash aCoreHash = new CompanyDAO().listCompanies();
                         			while (enu.hasMoreElements()) {
                         				notification = (Notification) enu.nextElement();
                         %><option value="<%=(notification.getNotificationID())%>"><%=(notification.getNotificationID())%></option> 
                         <%
                          	}
                          		}
                          	} catch (Exception e) {
                          	}
                          %>
                                                </select></td>
                      </tr>
                      
                      <tr>
                        <td height="226" colspan="2" valign="top" class="style25">
<%
	if (request.getParameter("notiid") != null && !request.getParameter("notiid").equals("--None--")) {
		CoreHash tCoreHash = (CoreHash) session
				.getAttribute("notifications");

		Notification aNotification = (Notification) tCoreHash
				.get(new Integer(request.getParameter("notiid")));
%>
<table border="0" align="center" >
<tr>
<td width="111" height="27" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Company Name</span></td>
<td width="193"><span class="style38">
  <label>
    <%
  	try {
  			String select = "";
  			cCoreHash = new CompanyDAO().listCompanies();
  			Enumeration enu = cCoreHash.keys();
  			int compid = 0;
  			while (enu.hasMoreElements()) {
  				select = "";
  				compid = ((Integer) enu.nextElement()).intValue();
  				if (compid == aNotification.getCompanyID()) {
  %>
    <%=((Company) cCoreHash.get(new Integer(compid))).getCompanyName()%>
    <%
	}
			}
		} catch (Exception e) {
			LoggerManager.writeLogWarning(e);
		}
%>
  </label>
</span></td>
</tr>
<tr>
<td height="27" bgcolor="#FFB66B" class="style36 style39">No of Vacancies</td>
<td><span class="style38">
  <label>
  <%=(aNotification.getNoofvac())%>  </label>
</span></td>
</tr>
<tr>
<td height="22" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Description</span></td>
<td><span class="style38">
  <label>
  <%=(aNotification.getJobdesc())%>  </label>
</span></td>
</tr>
<tr>
<td height="24" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Category</span></td>
<td><span class="style38">
  <label><%=(aNotification.getCategory())%>  </label>
</span></td>
</tr>
<tr>
<td height="27" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Location</span></td>
<td><span class="style38">
  <label>
  <%=(aNotification.getLocation())%>  </label>
</span></td>
</tr>
<tr>
<td height="27" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Desired Skills</span></td>
<td><span class="style38">
  <label><%=(aNotification.getDesiredskills())%>  </label>
</span></td>
</tr>

<tr>
<td height="27" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Created Date</span></td>
<td><span class="style38">
  <label>
  <%=DateWrapper.parseDate(aNotification.getCreateddate1())%>  </label>
</span></td>
</tr>
<tr>
<td height="27" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Expiry Date</span></td>
<td><span class="style38">
  <label>
  <%=DateWrapper.parseDate(aNotification.getExpirydate1())%>  </label>
</span></td>
</tr>

<tr>
<td height="27" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Designation</span></td>
<td><span class="style38">
  <label>
  <%=(aNotification.getDesignation())%>  </label>
</span></td>
</tr>
<tr>
<td height="27" bgcolor="#FFB66B" class="style36"><span class="style36 style39">Status</span></td>
<td><span class="style38">
  <label>  <%=(aNotification.getStatus())%> </label>
</span></td>
</tr>

<tr></tr>
</table>
<%
	}
%>                          </td>
                        </tr>
                      
                  </table>
                </div>
                  
                    
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