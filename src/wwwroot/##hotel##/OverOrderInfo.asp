<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"JA") then
		response.Write("<script lanaguage=javascript>alert('您无权限查看此页面.');history.back(-1);</script>")
		response.End()
	end if
%>
<html>
<head>
<title>处理完毕的会员预定信息管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../ticket/css/Admin_STYLE.CSS">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart ="return false" scroll="no">
<!--#include file="include/conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where flag=1 order by id desc" 
rs.open sqltext,conn,1,1
'显示帖子的子程序
If rs.eof or rs.bof then 
   call showempty()
else
   call list()
End if
Sub list()%>
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#009286" borderColorDark=#ffffff bgcolor="#F9F9F9">
              <tr class="topbg" align="center">
                <td height="25">编号</td>
                <td>帐号</td>
                <td>姓名</td>
                <td>联系电话</td>
                <td>电子邮件</td>
                <td>预定酒店</td>
                <td>预定房型</td>
                <td>确认方式</td>
                <td>操作</td>
              </tr>
<% while not rs.eof %>
              <tr>
                <td align="center" height="25"><%=rs("id")%></td>
                <td align="center"><%=rs("userid")%>&nbsp;</td>
                <td align="center"><%=rs("username")%></td>
                <td align="center"><%=rs("mobiletel")%></td>
                <td align="center"><%=rs("email")%></td>
                <td align="center"><%=rs("c_id")%></td>
                <td align="center"><%=rs("roomtype")%></td>
                <td align="center"><%=rs("affirmtype")%></td>
                <td align="center">
                <input name="button" type="button" onClick=" window.location='Overorderdetail.asp?id=<%=rs("id")%>'" value="详情">
                <input name="button2" type="button" onClick="if (confirm('确实要此条记录吗？')) window.location='OverOrderinfodel.asp?id=<%=rs("id")%>'" value="删除"></td>
              </tr>
<%
rs.movenext
wend
%>
</table>
<%
End sub
rs.close
conn.close
'显示空帖子的子程序
Sub showempty()%>
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
              <tr class="topbg" align="center">
                <td height="25">编号</td>
                <td>帐号</td>
                <td>姓名</td>
                <td>联系电话</td>
                <td>电子邮件</td>
                <td>预定酒店</td>
                <td>预定房型</td>
                <td>确认方式</td>
                <td>操作</td>
              </tr>
              <tr>
                <td align="center" height="25" colspan="9"> 无相关信息！</td>
              </tr>
</table>
<%
End sub
%>
</body>
</html>