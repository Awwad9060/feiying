<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"JA") then
		response.Write("<script lanaguage=javascript>alert('����Ȩ�޲鿴��ҳ��.');history.back(-1);</script>")
		response.End()
	end if
%>
<html>
<head>
<title>������ϵĻ�ԱԤ����Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../ticket/css/Admin_STYLE.CSS">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart ="return false" scroll="no">
<!--#include file="include/conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where flag=1 order by id desc" 
rs.open sqltext,conn,1,1
'��ʾ���ӵ��ӳ���
If rs.eof or rs.bof then 
   call showempty()
else
   call list()
End if
Sub list()%>
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#009286" borderColorDark=#ffffff bgcolor="#F9F9F9">
              <tr class="topbg" align="center">
                <td height="25">���</td>
                <td>�ʺ�</td>
                <td>����</td>
                <td>��ϵ�绰</td>
                <td>�����ʼ�</td>
                <td>Ԥ���Ƶ�</td>
                <td>Ԥ������</td>
                <td>ȷ�Ϸ�ʽ</td>
                <td>����</td>
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
                <input name="button" type="button" onClick=" window.location='Overorderdetail.asp?id=<%=rs("id")%>'" value="����">
                <input name="button2" type="button" onClick="if (confirm('ȷʵҪ������¼��')) window.location='OverOrderinfodel.asp?id=<%=rs("id")%>'" value="ɾ��"></td>
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
'��ʾ�����ӵ��ӳ���
Sub showempty()%>
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
              <tr class="topbg" align="center">
                <td height="25">���</td>
                <td>�ʺ�</td>
                <td>����</td>
                <td>��ϵ�绰</td>
                <td>�����ʼ�</td>
                <td>Ԥ���Ƶ�</td>
                <td>Ԥ������</td>
                <td>ȷ�Ϸ�ʽ</td>
                <td>����</td>
              </tr>
              <tr>
                <td align="center" height="25" colspan="9"> �������Ϣ��</td>
              </tr>
</table>
<%
End sub
%>
</body>
</html>