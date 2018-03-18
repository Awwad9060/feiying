<!--#include file="../../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"HT") then
		response.Write("<script lanaguage=javascript>alert('提示：\n\n对不起，您没有管理此栏目的权限\n\n请联系管理员！');history.back(-1);</script>")
		response.End()
	end if
%>
<!--#include file="../../ticket/include/conn.asp"-->
<%
   dim SQL, Rs, contentID,CurrentPage
   contentID=request("ID")

   set rs=server.createobject("adodb.recordset")
   sqltext="delete * from orderb where id="& contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
   response.redirect "passOrderInfo.asp"
%>