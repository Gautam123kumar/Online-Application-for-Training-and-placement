<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Training and Placement Operations</title>
<link href="index_files/Style.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="index_files/main_menu.js"></script>
<script language="javascript">
function validate()
{
   var temp = document.changequestion;
   if(temp.username.value=="" || temp.password.value=="" || temp.sanswer.value=="")
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
<script type="text/javascript" src="scripts/general.js"> </script>
<script language="javascript">
		function check1()
		{
		    if(!document.changequestion.ch.checked){
                        document.changequestion.ownquest.disabled=true;
                        document.changequestion.squest.disabled=false;
                    }
                    else{
                        document.changequestion.ownquest.disabled=false;
                        document.changequestion.squest.disabled=true;
                    }
		}
		</script>

<style type="text/css">
<!--
.style23 {font-size: 14px; font-weight: bold; color: #CC856A; }
.style38 {font-size: 18px}
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
                  <p class="style36 style38">Change Question    </p>
              </div></td>
            </tr>
            <tr>
              <td height="232" valign="top">
              <form name="changequestion" action="ChangequestionAction.jsp" onSubmit="return validate()">
                <table width="296" border="0" align="center" bordercolor="#CD817E" bgcolor="#FFDBA6">
                
                <tr>
                  <td width="300"><table width="390" border="0" align="center" bgcolor="#FFDBA6">
                      <tr>
                        <td width="101" class="style36">Login Name </td>
                        <td width="269"><label>
                          <input type="text" name="username">
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style36">Password </td>
                        <td><label>
                          <input type="password" name="password">
                        </label></td>
                      </tr>
                      <tr>
                        <td class="style36"><label>Secret Question</label></td>
                        <td><select name="squest">
                            <option value="1">What is your favorite pastime?</option>
                            <option value="2">Who was your childhood hero?</option>
                            <option value="3">What was the name of your first school?</option>
                            <option value="4">Where did you meet your spouse?</option>
                            <option value="5">What is your favorite sports team?</option>
                            <option value="6">What is your father's middle name?</option>
                            <option value="7">What was your high school mascot?</option>
                            <option value="8">What make was your first car or bike?</option>
                            <option value="9">What is your pet's name?</option>
                        </select></td>
                      </tr>
                      <tr class="style23">
                        <td colspan="2"><label>
                          <input type="checkbox" name="ch" value="1" onClick="check1()">
                          <span class="style36">Own Question </span></label></td>
                      </tr>
                      <tr>
                        <td class="style36">Own Question </td>
                        <script>
        
                            </script>
                        <td><label>
                          <input type="text" name="ownquest" disabled>
                        </label></td>
                      </tr>
                      <tr>
                        <td height="38" class="style36">Secret Answer </td>
                        <td><input name="sanswer" type="text"></td>
                      </tr>
                      <tr>
                        <td colspan="2"><div align="center">
                            <input name="Input" type="submit" value="Change">
                          </div>
                            <div align="center"></div></td>
                      </tr>
                  </table></td>
                  </tr>
                <tr>
                  <td height="21" valign="baseline"><div align="center"><img src="images/regisbot.gif" alt="a" width="280" height="3"></div></td>
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