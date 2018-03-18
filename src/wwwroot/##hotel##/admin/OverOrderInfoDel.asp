<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="../../ticket/Admin-manager/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(session("UserPower"),"HT") then
		response.Write("<script lanaguage=javascript>alert('提示：\n\n對不起，您沒有管理此欄目的權限\n\n請聯系管理員！');history.back(-1);</script>")
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