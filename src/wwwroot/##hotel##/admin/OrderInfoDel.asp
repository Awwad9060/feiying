<!--#include file="../../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"HT") then
		response.Write("<script lanaguage=javascript>alert('��ʾ��\n\n�Բ�����û�й������Ŀ��Ȩ��\n\n����ϵ����Ա��');history.back(-1);</script>")
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