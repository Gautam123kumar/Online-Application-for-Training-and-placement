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
.style40 {color: #000000}
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
              <td height="232" valign="bottom">
              <form action="SkillAction.jsp" name="acadamicreg" id="acadamic" method="post">
               <input type="hidden"  name="loginname" value="<%=(String)session.getAttribute("user")%>">
                <table width="475" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                
                <tr>
                  <td width="469" height="141"><table width="468" border="1" align="center" bordercolor="#FFC164" bgcolor="#FFDBA6">
                      <tr>
                        <td width="20"><label></label></td>
                        <td width="144"><div align="center"><span class="style38 style36"><strong><span class="style37 style40">Skill Name</span></strong></span></div></td>
                        <td width="210" ><div align="center"><span class="style40"><strong>Description</strong></span></div></td>
                        <td width="76"><div align="center"><span class="style40"><strong>Level</strong></span></div></td>
                        </tr>
                        <%
						  for(int i=1; i<=5; i++)
						  {
						%>
                      <tr>
                        <td class="style36"><input type="checkbox" name="ch<%=i%>" id="checkbox2"></td>
                        <td class="style36"><label>
                          <input type="text" name="skillname<%=i%>" id="textfield">
                        </label></td>
                        <td ><label>
                          <textarea name="description<%=i%>" id="textarea" cols="45" rows="5"></textarea>
                        </label></td>
                        <td width="76" class="style36"><label>
                          <select name="level<%=i%>" id="select">
                            <option value="Normal">Normal</option>
                            <option value="Intermediate">Intermediate</option>
                            <option value="Expert">Expert</option>
                          </select>
                        </label></td>
                        </tr>
                      <%}%>
                      <tr>
                        <td colspan="4">  <div align="center">
                            <input type="submit" name="button" id="button" value="Add">&nbsp;<input type="button" value="Update" onclick="javascript:location.href='viewSkillinfo.jsp'"/>
                            </div>
                        </td>
                      </tr>
                  </table></td>
                  </tr>
                <tr>
                  <td height="15" valign="baseline"><div align="center"><img src="images/regisbot.gif" alt="a" width="400" height="3"></div></td>
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