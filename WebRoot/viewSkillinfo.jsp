<%@ page import="com.dts.tpo.dao.*,com.dts.tpo.model.*,com.dts.core.util.DateWrapper" %>
<%@page import="com.dts.tpo.model.Aggregates"%>
<%@page import="com.dts.tpo.dao.AggregatesDAO"%>
<%@page import="com.dts.core.util.CoreHash"%>
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
-->
</style>
</head>
<body  leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="index_files/BG.gif" bgcolor="silver"><center>
<table style="width: 778px;" background="" border="0" cellpadding="0" cellspacing="0" width="833">
  <tbody>
  
  <tr>
    <td width="778" align="left" valign="top">
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
      <table bgcolor="#ff9900" border="0" cellpadding="0" cellspacing="0" width="757">
       
        <tr>
          <td width="14"></td>
          <td width="743" height="391" align="center" valign="top" background="index_files/BG.gif" bgcolor="#ff9900" style="width: 190px;"><div align="center">
            <table width="715" border="0" align="center">
            <tr>
              <td width="709" height="42"><div align="center" class="style25">
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
              <form name="acadamicreg" action="UpdateSkillAction.jsp" >
               <input type="hidden" name="loginname" value="<%=(String)session.getAttribute("user")%>"/>        <%
               try
               {
        			String username=(String)session.getAttribute("user");
            		CoreHash tCoreHash = new SkillDAO().getSkills(username); 
            		CoreHash aCoreHash = (CoreHash)tCoreHash.get(username); 
            		//if(!aCoreHash.isEmpty())
            		{
                                 
        %>
                <table width="528" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                 
                  <tr>
                    <td width="522" valign="top"><table width="468" border="1" align="center" bordercolor="#FFC164" bgcolor="#FFDBA6">
                     <tr>
                        <td width="20"><label></label></td>
                        <td width="144"><div align="center"><span class="style38 style36"><strong><span class="style37 style40">Skill Name</span></strong></span></div></td>
                        <td width="210" ><div align="center"><span class="style40"><strong>Description</strong></span></div></td>
                        <td width="76"><div align="center"><span class="style40"><strong>Level</strong></span></div></td>
                        </tr>
                    <%
					Skill aSkill = null;
					int i=1;
					System.out.println(aCoreHash.size());
					for(i=1; i<=aCoreHash.size(); i++)
					{
					     aSkill = (Skill)aCoreHash.get(new Integer(i)); 
					     if(aSkill!=null)
					     {	     
					%>
                      <tr>
                        <td class="style36"><input type="checkbox" name="ch<%=i%>" id="checkbox2"></td>
                        <td class="style36"><label>
                          <input type="text" name="skillname<%=i%>" id="textfield" readonly value="<%=aSkill.getSkillname() %>">
                        </label></td>
                        <td ><label>
                          <textarea name="description<%=i%>" id="textarea" cols="45" rows="5"><%=aSkill.getDescription() %></textarea>
                        </label></td>
                        <td width="76" class="style36"><label>
                          <select name="level<%=i%>" id="select">
                            <option value="<%=aSkill.getLevel()%>"><%=aSkill.getLevel()%></option>
                            <option value="Normal">Normal</option>
                            <option value="Intermediate">Intermediate</option>
                            <option value="Expert">Expert</option>
                          </select>
                        </label></td>
                        </tr>
                      <%}
					  
                      
					  }%>
                      <tr>
                        <td colspan="7"><div align="center"><br>
                               <input type="button" value="Add New" onclick="javascript:location.href='StudentSkills.jsp'"/>&nbsp; <input type="submit" name="Submit" value="Update">&nbsp; <input type="submit" name="Submit" value="Delete">
                        </div></td>
                      </tr>
                      <tr>
                        <td colspan="4" valign="top">&nbsp;</td>
                      </tr>
                    </table>
                      <%}
					%>
	               
                 </form>
					</td>
                  </tr>
                  <tr>
                    <td height="21" valign="top"><div align="center"><img src="images/regisbot.gif" alt="a" width="280" height="3"></div></td>
                  </tr>
                </table>
                <%}
				catch(Exception e){}%>
              </form>             </td>
            </tr>
        </table>
      </div>  </div></div>       </td>
          <td width="22" bgcolor="#FF9A00"></td>
    </tr>
        <tr>
          <td height="19" colspan="3" align="left" valign="top" bgcolor="#ff9900" style="width: 190px;">&nbsp;</td>
    </tr>
</table></td></tr>
  <tr>
    <td align="left" valign="top">&nbsp;    </td>
  </tr>
  <tr>
    <td><img style="width: 503px; height: 4px;" alt="" src="index_files/TOP.gif" height="5" width="15"></td>
  </tr>
  </tbody></table>
</body></html>