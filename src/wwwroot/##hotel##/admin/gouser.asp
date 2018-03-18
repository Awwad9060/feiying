<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<!--#include file="../../ticket/Admin-manager/Admin_include.asp"-->
<!--#include file="../../include/conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="../../ticket/Css/css.css">
<link rel="stylesheet" href="../../ticket/css/Admin_STYLE.CSS">
<title>訂單轉移</title>
<script language="javascript">
function checkform(){
 	//frmUserDetail.edit.value = "ok" ;
if(frmUserDetail.adminPass.value==""){  
	alert("當前沒有可用于轉移的工作號！");
	frmUserDetail.adminPass.focus();
	return false ;
	}
}
</script>
</head>
<%
if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
if not IsPower(session("UserPower"),"HT") then
	response.Write("<script lanaguage=javascript>alert('您无权限查看此頁面.');history.back(-1);</script>")
	response.End()
end if

Module = request.QueryString("FLIGHT")
OrderId = request.QueryString("OrderId")

ticketpass=request.form("ticketpass")
TicketId=request.form("TicketId")
adminPass=request.form("adminPass")

if trim(ticketpass)="ticket" then
	set strrs=server.CreateObject("adodb.recordset")
	sql="select * from ordertext where order_id ='"&TicketId&"'"
	'response.Write(sql)
	'response.End()
	strrs.open sql,conn,3,2
		strrs("order_name")=adminPass
		strrs.update
	set strrs=nothing
	response.Write("<script lanaguage=javascript>alert('訂單轉移成功.');</script>")
	Response.Write("<script>window.opener.location.href=window.opener.location.href;window.close();</script>")
	response.End()
End if
%>
<body topmargin="10" scroll="no">
<form name="frmUserDetail" method="post" action="gouser.asp"  onsubmit="return checkform();">
<table cellSpacing="1" cellPadding="4" width="100%"  align="center" border="0">
<input type="hidden" name="ticketpass" value="ticket">
<input type="hidden" name="TicketId" value="<%=OrderId%>">
<tbody>
	<tr class="topbg">
		<td vAlign="top" noWrap align="center" colSpan="4"><FONT color="#ffffff">機票訂單轉移</FONT></td>
	</tr>
	<tr bgColor="#eeeee6">
		<td align="right" width="20%"><FONT color="#804000">訂單號：</FONT></td>
		<td colSpan="3"><span id="LabCurStatus" style="color:Red;"><%=OrderId%></span></td>
	</tr>
	<tr bgColor="#eeeee6">
		<td align="right" width="20%"><FONT color="#804000">轉移給：</FONT></td>
		<td colSpan="3">
		<select name="adminPass" style="width:120px;">
		<%
			adminJA = "JA"
			set rs=Server.CreateObject("Adodb.recordset")
			sql = "select * from HotelAdminInfo where UserPower like '%"&adminJA&"%' and ADM_User<>'"&session("Admin_Name")&"' and ActiveStatus='Y' and UserType <> 'Admin' order by id"
			rs.open sql,conn,1,1
			if rs.eof or rs.bof then
				Response.Write "<option value="""">沒有可轉移工作號</option>"
					else
				do while not rs.eof
				Response.Write "<option value="""&trim(rs("ADM_User"))&""">"&rs("ADM_User")&"</option>"
				rs.movenext
				loop
			End if
			rs.close
		%>
		</select>
		</td>
		</tr>
		<tr bgColor="#eeeee6">
			<td align="right" width="20%"></td>
			<td colSpan="3"></td>
		</tr>
		<tr bgColor="#eeeee6">
			<td colSpan="4" align="center">
			<input name="Submit" type="submit" class="submenu" value="確認轉移">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name="BtnClose" value="關閉窗口"  onClick="window.close();"/>
			</td>
		</tr>
	</tbody>
</table>
</form>