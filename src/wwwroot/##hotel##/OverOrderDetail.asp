<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"JA") then
		response.Write("<script lanaguage=javascript>alert('����Ȩ�޲鿴��ҳ��.');history.back(-1);</script>")
		response.End()
	end if
%>
<!--#include file="include/conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where id="&request("id")&"" 
rs.open sqltext,conn,1,1
%>
<html>
<head>
<title>����Ԥ����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../ticket/css/Admin_STYLE.CSS">
</head>
<body  text="#000000" oncontextmenu="window.event.returnValue=false">
<FORM ACTION="OrderInfoUpdate.asp" METHOD="POST" NAME="formSignUp">
<input type=hidden name=id value=<%=rs("id")%>>
  <table width="99%"  border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#009286" borderColorDark=#ffffff bgcolor="#F9F9F9">
    <TBODY>
                <tr>
                  <TD height=25 colspan="2" class="topbg">&nbsp;Ԥ������</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>�µ�ʱ��<span lang="en-us">�� </span></span></TD>
                  <TD width=426 height=25><%=rs("regtime")%></TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>����״̬��</span></TD>
                  <TD width=426 height=25><%if rs("flag")=1 then%>
                      <font color="#008000">�������</font>
                      <%else%>
                      <font color="#FF0000">δ���κδ���</font>
                      <%end if%></TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>�������ƣ�</span></TD>
                  <TD width=426 height=25><%=rs("c_id")%> </TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>��ס���ڣ�</span></TD>
                  <TD  width=426 height=25 ><%=rs("jointime")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">������ڣ�</TD>
                  <TD width=426 height=25><%=rs("leavetime")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> ���㷽ʽ��</TD>
                  <TD width=426 height=25><%=rs("paytype")%> ��</TD>
                </tr>
                <tr>
                  <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                    <p align="left">&nbsp;����ѡ��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">���ͣ�</TD>
                  <TD width=426 height=25><%=rs("roomtype")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> Ԥ��������</TD>
                  <TD width=426 height=25><%=rs("roomnum")%> &nbsp;��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> �ܽ�</TD>
                  <TD width=426 height=25> RMB&nbsp;<%=rs("totalnum")%></TD>
                </tr>
                <tr>
                  <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                    <p align="left">&nbsp;Ԥ������</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">��ס������</TD>
                  <TD width=426 height=25> <%=rs("number")%>��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">��ס����ݣ�</TD>
                  <TD width=426 height=25><%=rs("degree")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">��ס�Ǽ��ˣ�</TD>
                  <TD width=426 height=25><%=rs("man1")%>,<%=rs("man2")%>,<%=rs("man3")%>,<%=rs("man4")%>,<%=rs("man5")%>,<%=rs("man6")%>,<%=rs("man7")%>,<%=rs("man8")%> </TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> ����Ŀ�ĵط�ʽ��</TD>
                  <TD width=426 height=25><%=rs("cometype")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> ���絽��ʱ�䣺</TD>
                  <TD width=426 height=25><%=rs("earlytime")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> ������ʱ�䣺</TD>
                  <TD width=426 height=25><%=rs("latetime")%> ��</TD>
                </tr>
                <tr>
                  <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                    <p align="left">&nbsp;��ϵ��Ϣ</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > ��Ա�ʺţ�</TD>
                  <TD width=426 height=25><%=rs("userid")%></TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > ��ϵ�ˣ�</TD>
                  <TD width=426 height=25><%=rs("username")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > �ֻ���绰��</TD>
                  <TD width=426 height=25><%=rs("mobiletel")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > ���棺</TD>
                  <TD width=426 height=25><%=rs("fax")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > �����ʼ���</TD>
                  <TD width=426 height=25><%=rs("email")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > ȷ�Ϸ�ʽ��</TD>
                  <TD width=426 height=25><%=rs("affirmtype")%> ��</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB >����˵����</TD>
                  <TD width=426 height=25><%=rs("explain")%> ��</TD>
                </tr>
                <TR class="topbg" align=center>
                  <TD height="30" colSpan=2>
          <INPUT class=main type=button size=3 value=������ҳ name=Submit2 onClick="javascript:window.history.go(-1)">
                  </TD>
                </TR>
    </TBODY>
  </TABLE>
</form>
</body>
</html>