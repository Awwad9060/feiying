<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="../../ticket/Admin-manager/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(session("UserPower"),"HT") then
		response.Write("<script lanaguage=javascript>alert('��ʾ��\n\n���������]�й���˙�Ŀ�ę���\n\nՈϵ����T��');history.back(-1);</script>")
		response.End()
	end if
%>
<!--#include file="../../include/conn.asp"-->
<%
   dim SQL, Rs, contentID,CurrentPage
   contentID=request("ID")

   set rs=server.createobject("adodb.recordset")
   sqltext="delete * from orderb where id="& contentID
   rs.open sqltext,conn,3,3
   rs.close
   set rs=nothing
   response.redirect "OverorderInfo.asp"
%>