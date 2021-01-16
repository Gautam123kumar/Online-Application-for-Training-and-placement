<%@ page import="com.dts.dae.*,com.dts.tpo.model.*,com.dts.tpo.dao.*" %>
<%@page import="com.dts.core.util.CoreHash"%>
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
   var temp = document.acadamic;
   if(temp.percentage1.value=="" || temp.percentage2.value=="" || temp.rollno.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   if(temp.ch.checked && temp.percentage3.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   if(!IsNumeric(temp.percentage1.value) || !IsNumeric(temp.percentage2.value))
   {
       alert("Percentage should be Neumeric");
       return false;
   }
   if(!IsNumeric(temp.rollno.value))
   {
       alert("Roll No. should be Neumeric");
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
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="index_files/BG.gif" bgcolor="silver" >
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
    <td>
      </td></tr>
  <tr>
    <td align="left" valign="top" bgcolor="#FF9A00">
      <table bgcolor="#ff9900" border="0" cellpadding="0" cellspacing="0" width="766">
        <tbody>
        
        <tr>
          <td width="14"></td>
          <td width="752" height="391" align="center" valign="top" background="index_files/BG.gif" bgcolor="#ff9900" style="width: 190px;"><div align="center">
            <table width="743" border="0" align="center">
            <tr>
              <td width="737" height="42"><div align="center" class="style25"><strong>
                 <%=request.getParameter("id")%> Acadamic Details</strong></div></td>
            </tr>
            <tr>
              <td height="232" valign="bottom">
              
               <input type="hidden"  name="loginname" value="<%=request.getParameter("id")%>">
               <%
                  String user = request.getParameter("id");
                  Acadamic aAcadamic = new AcadamicDAO().getAcademicDetails(user);
               
                %>
                <table width="447" border="0" align="center" bgcolor="#FFDBA6">
                      <tr>
                        <td width="163" class="style36 style38">SSC</td>
                        <td width="110" ></td>
                        <td width="89">&nbsp;</td>
                        <td width="67"></td>
                      </tr>
                      <tr>
                        <td class="style36">Year of Passed Out</td>
                        <td ><input name="textfield" type="text" id="textfield2" size="15" value="<%=aAcadamic.getYearofpass1() %>"></td>
                        <td width="89" class="style36">Percentage</td>
                        <td width="67"><label>
                          <input name="percentage1" type="text" id="textfield" size="15" value="<%=aAcadamic.getPercentage1() %>">
                        </label></td>
                      </tr>
                      <tr>
                        <td colspan="2"><span class="style36 style38">Under Graduation</span>                          <label></label></td>
                        <td>&nbsp;</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td class="style36">Year of Passed Out </td>
                        <td><label>
                          <input name="textfield10" type="text" id="textfield11" size="15" value="<%=aAcadamic.getYearofpass2() %>">
                        </label></td>
                        <td class="style36">Percentage</td>
                        <td><label>
                          <input name="textfield2" type="text" id="textfield3" size="15"  value="<%=aAcadamic.getPercentage2() %>">
                        </label></td>
                      </tr>
                      <tr>
                        <td colspan="2"><span class="style36 style38">
                          Graduation</span>                          <label></label></td>
                        <td>&nbsp;</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td height="31" class="style36">Year of Passed Out </td>
                        <td><label>
                          <input name="textfield9" type="text" id="textfield10" size="15" value="<%=aAcadamic.getYearofpass3() %>">
                        </label></td>
                        <td class="style36">Percentage</td>
                        <td><label>
                          <input name="textfield3" type="text" id="textfield4" size="15"  value="<%=aAcadamic.getPercentage3() %>">
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style36">Roll No (<span class="style39">Present</span>)</td>
                        <td colspan="3"><input name="textfield4" type="text" id="textfield5" size="15"  value="<%=aAcadamic.getRollno() %>"></td>
                      </tr>
                      <tr>
                        <td class="style37"><strong>Year of joining</strong></td>
                        <td colspan="3"><label>
                          <input name="textfield5" type="text" id="textfield6" size="15"  value="<%=aAcadamic.getYearofjoining()%>">
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style37"><strong>Course</strong></td>
                        <td colspan="3"><label>
                          <input name="textfield6" type="text" id="textfield7" size="15" value="<%=aAcadamic.getCourse() %>">
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style37"><strong>Discipline</strong></td>
                        <td colspan="3"><label>
                          <input name="textfield7" type="text" id="textfield8" size="15"  value="<%=aAcadamic.getDiscipline()%>">
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style37"><strong>Semister</strong></td>
                        <td colspan="3"><label>
                          <input name="textfield8" type="text" id="textfield9" size="15"  value="<%=aAcadamic.getSemister()%>">
                        </label></td>
                      </tr>
                      
                      <tr>
                        <td colspan="4" align = "center"><input type="button" value="Close" onClick="javascript:window.close()"/></td>
                      </tr>
                  </table>
                <div align="center">
                  <div align="center">
                    <%
				try
               {
        			String username=(String)session.getAttribute("user");
            		CoreHash tCoreHash = new AggregatesDAO().getAggregates(user);
            		CoreHash aCoreHash = (CoreHash)tCoreHash.get(user); 
            		//if(!aCoreHash.isEmpty())
            		{
                                 
        %>
                      <span class="style36">Aggregates</span> 
                     </div>
                  <table width="469" border="0" align="center" bgcolor="#FFDBA6">
                    <%
					Aggregates aAggregates = null;
					int i=1;
					for(i=1; i<=8; i++)
					{
					     aAggregates = (Aggregates)aCoreHash.get(new Integer(i)); 
					     if(aAggregates!=null)
					     {	     
					%>
                      <tr>
                       <td width="88" class="style36 style38">Semister <%=(aAggregates.getSemister())%></td>
                        <td width="144" ></td>
                        <td width="75">&nbsp;</td>
                        <td width="144"></td>
                      </tr>
                      <tr>
                      <td class="style36" align="right">Year</td>
                        <td ><label>
                          <input type="text" name="textfield" readonly id="textfield" value="<%=aAggregates.getYearOfPass()%>">
                        </label></td>
                        <td width="75" class="style36">Percentage</td>
                        <td width="144"><label>
                          <input type="text" name="textfield2"  readonly id="textfield2" value="<%=aAggregates.getAggregate()%>">
                        </label></td>
                      </tr>
                      <%}
					  else
					  {%>
                          <tr>
                        <td width="88" class="style36 style38">Semister <%=i%></td>
                        <td width="144" ></td>
                        <td width="75">&nbsp;</td>
                        <td width="144"></td>
                      </tr>
                      <tr>
                        <td class="style36" align="right">Year</td>
                        <td ><label>
                          <input type="text" name="sem<%=i %>pass" id="textfield">
                        </label></td>
                        <td width="75" class="style36">Percentage</td>
                        <td width="144"><label>
                          <input type="text" name="sem<%=i %>per" id="textfield2">
                        </label></td>
                      </tr>
                      <%
					  }}%>
                      <tr>
                        <td colspan="6"><div align="center"><br>
                          <input type="button" value="Close" onClick="javascript:window.close()"/>
</div></td>
                      </tr>
                     
                    </table>
                      <div align="center">
                        <%} }
				catch(Exception e){}%> 
                            <span class="style36" align="center">Skills</span>
                        
                        <%
			   try
               {
        			String username=(String)session.getAttribute("user");
            		CoreHash tCoreHash = new SkillDAO().getSkills(user); 
            		CoreHash aCoreHash = (CoreHash)tCoreHash.get(user); 
            		//if(!aCoreHash.isEmpty())
            		{
                                 
        %>
                        
                            </div>
                      <table width="468" border="1" align="center" bordercolor="#FFC164" bgcolor="#FFDBA6">
                     <tr>
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
                        <td class="style36"><label>
                          <input type="text" name="skillname<%=i%>" id="textfield" readonly value="<%=aSkill.getSkillname() %>">
                        </label></td>
                        <td ><label>
                          <textarea name="description<%=i%>" id="textarea" cols="35" rows="5"><%=aSkill.getDescription() %></textarea>
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
                        <td colspan="3" valign="top"><div align="center">
                          <input type="button" value="Close" onClick="javascript:window.close()"/>
                        </div></td>
                      </tr>
                    </table>
                      <%}
					%>
	               
                
					<%}
				catch(Exception e){}%>
					
   					</td>
                  </tr>
                  
                </table>
               
                 
              </td>
            </tr>
        </table>
      </td>
          <td width="13"></td>
    </tr>
        <tr>
          <td height="19" colspan="3" align="left" valign="top" bgcolor="#ff9900" style="width: 190px;">&nbsp;</td>
          </tr>
      
  <tr>
    <td align="left" valign="top">&nbsp;    </td>
  </tr>
  <tr>
    <td><img style="width: 503px; height: 4px;" alt="" src="index_files/TOP.gif" height="5" width="15"></td>
  </tr>
  </tbody></table>
</body></html>