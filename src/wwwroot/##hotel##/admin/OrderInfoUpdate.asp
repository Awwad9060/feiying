<%@ LANGUAGE = VBScript.Encode %>
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
   userID=request("userid")
   set rs=server.createobject("adodb.recordset")
   sqltext="update orderb set flag=1 where id="& contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
    set rs=server.createobject("adodb.recordset")
   sqltext="update jifen set tong=1 where dd='"&request("dd")&"' and jd='1'"
   'response.Write sqltext
   rs.open sqltext,conn,3,3
   'rs.close
   set rs=nothing
   response.write "<script language=JavaScript>{window.alert('订单处理完毕!');window.location.href='orderInfo.asp';}</script>"
%>