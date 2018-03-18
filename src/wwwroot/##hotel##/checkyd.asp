<!--#include file="include/cfg.asp"-->
<!--#include file="../ticket/include/conn.asp"-->
<!--#include file="../ticket/include/function.asp"-->
<%
From_url = Cstr(Request.ServerVariables("HTTP_REFERER")) 
Serv_url = Cstr(Request.ServerVariables("SERVER_NAME")) 
if mid(From_url,8,len(Serv_url)) <> Serv_url then 
Server.Transfer "err.asp"
response.end 
end if 

starttime = request.Form("starttime")
deptime = request.Form("deptime")
 randomize timer
 sj=int(rnd*9998888)+1
 dd="955"&sj
 jltime = datediff("d",starttime,deptime)
 if jltime <= 0 then
 response.write "<script LANGUAGE='javascript'>alert('您预订的时间有误，入住的时间差不能少于一天');history.go(-1);</script>"
 response.End
 end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>酒店订房 - <%=ZXLCompanyStr%></title>
<link rel="stylesheet" href="images/style.css" type="text/css">
<link href="../Css/main_api.css" type="text/css" rel="stylesheet" />
</head>
<body text="555555" link="555555" vlink="555555" alink="555555" leftmargin="0" topmargin="0" marginwidth="0" arginheight="0">
<!--#include file="header.asp"-->
<table width="980" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
	<td height="37" align="right"><img src="images/pic_schedule04.gif" width="200" height="26"></div></td>
  </tr>
</table>
<table id=zy width=980 align="center" border=0 cellPadding=0 cellSpacing=0 bordercolor=#BDDDF9 borderColorDark=#ffffff bgcolor=#FFFFFF>
<FORM ACTION="OrderSave.asp" METHOD="POST" NAME="formSignUp" style="margin:0px;">
  <TBODY>
	<tr> 
	  <TD width="980" height=30>
		<table width="980" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#BDDDF9" style="border-collapse:collapse; margin-bottom:10px">
		  <tr>
			  <td height="26">&nbsp;<img src="images/1.jpg" width="11" height="11"> <font style="font-size:14px; color:#FF0000"><%=KillKey(request.Form("hotelname"))%></font></td>
		  </tr>
		  <tr> 
			<td height="28" align="left" background="images/bg_listTitle01.gif" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;入住日期：<%=KillKey(request.Form("starttime"))%> 
			  离店日期：<%=KillKey(request.Form("deptime"))%> </td>
		  </tr>
		</table>
		</TD>
	</tr>
	<tr> 
	  <TD height=30> 
		<table width="980" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#BDDDF9" style="border-collapse:collapse; margin-bottom:10px">
		 <tr><td colspan="4" height="26">&nbsp;<img src="images/2.jpg" width="11" height="11"> <font style="font-size:14px; color:#FF0000">您的订单资料：</font></td></tr>
		  <tr> 
			<td width="114" height="28" align="center" background="images/bg_listTitle01.gif">定单号</div></td>
			<td width="344" align="center" background="images/bg_listTitle01.gif">酒店资料</td>
			<td width="108" align="center" background="images/bg_listTitle01.gif">单间费用</td>
			<td width="160" align="center" background="images/bg_listTitle01.gif">备注</td>
		  </tr>
		  <tr bgcolor="#FFFFFF"> 
			<td height="5" align="center"><%=dd%></td>
			<td height="5" align="center" style="padding-top:5px;">&nbsp; <%=KillKey(request.Form("hotelname"))%> 
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr> 
				  <td height="26" align="center"><%=KillKey(request.Form("roomtype"))%>：<font color=ff0000><b><%=KillKey(request.Form("Roomcount"))%></b></font>（间） 入住：<font color=ff0000><b><%=datediff("d",request("starttime"),request("deptime"))%></b></font>（晚） 共：<font color=ff0000><b><%=request("personcount")%></b></font>人</td>
				</tr>
			  </table>
			</td>
			<td height="26" align="center"><%=KillKey(request.Form("price"))%>/间</td>
			<td align="center" style="font-size:12px; line-height:160%;">线上预付<br>入住日期：<%=KillKey(request.Form("starttime"))%></td>
		  </tr>
		  <tr bgcolor="#FFFFFF"> 
			<td height="28" colspan="4" align="right" style="padding-right:20px;">总费用：<font style="font-size:14px; color:#FF0000"><b><%=request.Form("Roomcount")%></B>间 * <%=request.Form("price")%>/间 = <%=request.Form("Roomcount") * request.Form("price")%></font></td>
		  </tr>
		</table>
	  </TD>
	</tr>
	<TR> 
	  <TD height="35"> <p align="center"> 
		  <input type=hidden name="dd" value="<%=dd%>">
		  <input type=hidden name="hotelid" value="<%=KillKey(request.Form("hotelid"))%>">
		  <input type=hidden name="hotelname" value="<%=KillKey(request.Form("hotelname"))%>">
		  <input type=hidden name="roomtype" value=<%=KillKey(request.Form("roomtype"))%>>
		   <input type=hidden name="starttime" value="<%=KillKey(request.Form("starttime"))%>">
			<input type=hidden name="deptime" value="<%=KillKey(request.Form("deptime"))%>">
			<input type=hidden name="paytype" value="线上预付">
			<input type=hidden name="pricelist" value="<%=KillKey(request.Form("pricelist"))%>">
			<input type=hidden name="roomid" value="<%=KillKey(request.Form("roomid"))%>">
			<input type=hidden name="Roomcount" value="<%=KillKey(request.Form("Roomcount"))%>">
			<input type=hidden name="price" value="<%=KillKey(request.Form("price"))%>">
			<input type=hidden name="personcount" value="<%=KillKey(request.Form("personcount"))%>">
			<input type=hidden name="clientComeFrom" value="<%=KillKey(request.Form("clientComeFrom"))%>">
			<input type=hidden name="clientname1" value="<%=KillKey(request.Form("clientname1"))%>">
			<input type=hidden name="clientname2" value="<%=KillKey(request.Form("clientname2"))%>">
			<input type=hidden name="clientname3" value="<%=KillKey(request.Form("clientname3"))%>">
			<input type=hidden name="clientname4" value="<%=KillKey(request.Form("clientname4"))%>">
			<input type=hidden name="clientname5" value="<%=KillKey(request.Form("clientname5"))%>">
			<input type=hidden name="clientname6" value="<%=KillKey(request.Form("clientname6"))%>">
			<input type=hidden name="clientname7" value="<%=KillKey(request.Form("clientname7"))%>">
			<input type=hidden name="clientname8" value="<%=KillKey(request.Form("clientname8"))%>">
			<input type=hidden name="ArrivalWay" value="<%=KillKey(request.Form("ArrivalWay"))%>">
			<input type=hidden name="EarlyArrivalTime" value="<%=KillKey(request.Form("EarlyArrivalTime"))%>">
			<input type=hidden name="arrivalTime" value="<%=KillKey(request.Form("arrivalTime"))%>">
			<input type=hidden name="contactname" value="<%=KillKey(request.Form("contactname"))%>">
			<input type=hidden name="Phone" value="<%=KillKey(request.Form("Phone"))%>">
			<input type=hidden name="fax" value="<%=KillKey(request.Form("fax"))%>">
			<input type=hidden name="email" value="<%=request.Form("email")%>">
			<input type=hidden name="ConfirmType" value="<%=KillKey(request.Form("ConfirmType"))%>">
			<input type=hidden name="info" value="<%=KillKey(request.Form("info"))%>">
		    <INPUT TYPE=submit VALUE=" 确认预订 " CLASS="medium"  NAME="signup_submit">
	  </TD>
	</TR>
  </TBODY>
</form>
</TABLE>
<!--#include file="footer.asp"-->
</body>
</html>