<!--#include file="../../ticket/include/conn.asp"-->
<!--#include file="../../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"HT") then
		response.Write("<script lanaguage=javascript>alert('��ʾ��\n\n�Բ�����û�й������Ŀ��Ȩ��\n\n����ϵ����Ա��');history.back(-1);</script>")
		response.End()
	end if
%>
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where id="&request("id")&"" 
rs.open sqltext,conn,1,1
%>
<html>
<head>
<title>����Ԥ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<link rel="stylesheet" href="../../ticket/css/Admin_STYLE.CSS">
</head>
<body>
<FORM ACTION="OrderInfoUpdate.asp" METHOD="POST" NAME="formSignUp">
<input type=hidden name=id value=<%=rs("id")%>>
<input type=hidden name=userid value=<%=rs("userid")%>>
<input type=hidden name=idd value=<%=rs("idd")%>>
<input type=hidden name=dd value=<%=rs("dd")%>>
    <table width="99%"  border=1 cellPadding=0 cellSpacing=0 bordercolor="#009286" borderColorDark=#ffffff bgcolor="#F9F9F9" align="center">
      <TBODY>
			<tr>
				<td  colspan="2" height="30" valign="middle" style="font-size:14px; font-weight:bold; color:#3300FF">�������������</td>
			</tr>
            <tr>
              <TD height=25 colspan="2" class="topbg">&nbsp;��������</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>�µ�ʱ��<span lang="en-us">�� </span></span></TD>
              <TD width=771 height=25><%=rs("regtime")%></TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>����״̬��</span></TD>
              <TD width=771 height=25><%if rs("flag")=1 then%>
                  <font color="#008000">�������</font>
                  <%else%>
                  <font color="#FF0000">δ���κδ���</font>
              <%end if%></TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>�������ƣ�</span></TD>
              <TD width=771 height=25><%=rs("c_id")%></TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>��ס���ڣ�</span></TD>
              <TD  width=771 height=25 ><%=rs("jointime")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >������ڣ�</SPAN></TD>
              <TD width=771 height=25><%=rs("leavetime")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>���㷽ʽ��</span></TD>
              <TD width=771 height=25><%=rs("paytype")%> ��</TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                <p align="left">&nbsp;����ѡ��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >���ͣ�</SPAN></TD>
              <TD width=771 height=25><%=rs("roomtype")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>Ԥ��������</span></TD>
              <TD width=771 height=25><%=rs("roomnum")%> &nbsp;�� ��<%=rs("price")%>Ԫ/ÿ�䣩</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>�ܽ�</span></TD>
              <TD width=771 height=25> &nbsp;<%=rs("totalnum")%> </TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                <p align="left">&nbsp;Ԥ������</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >��ס������</SPAN></TD>
              <TD width=771 height=25> &nbsp;<%=rs("number")%>��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >��ס����ݣ�</SPAN></TD>
              <TD width=771 height=25><%=rs("degree")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >��ס�Ǽ��ˣ�</SPAN></TD>
              <TD width=771 height=25><%=rs("man1")%>,<%=rs("man2")%>,<%=rs("man3")%>,<%=rs("man4")%>,<%=rs("man5")%>,<%=rs("man6")%>,<%=rs("man7")%>,<%=rs("man8")%> </TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>����Ŀ�ĵط�ʽ��</span></TD>
              <TD width=771 height=25><%=rs("cometype")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>���絽��ʱ�䣺</span></TD>
              <TD width=771 height=25><%=rs("zs")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>������ʱ�䣺</span></TD>
              <TD width=771 height=25><%=rs("ws")%> ��</TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                <p align="left">&nbsp;��ϵ��Ϣ</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>��Ա�ʺţ�</span></TD>
              <TD width=771 height=25><%=rs("userid")%></TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>��ϵ�ˣ�</span></TD>
              <TD width=771 height=25><%=rs("username")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>�ֻ���绰��</span></TD>
              <TD width=771 height=25><%=rs("mobiletel")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>���棺</span></TD>
              <TD width=771 height=25><%=rs("fax")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>�����ʼ���</span></TD>
              <TD width=771 height=25><%=rs("email")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>ȷ�Ϸ�ʽ��</span></TD>
              <TD width=771 height=25><%=rs("affirmtype")%> ��</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB ><SPAN >����˵����</SPAN></TD>
              <TD width=771 height=25><%=rs("explain")%> ��</TD>
            </tr>
            <TR class="topbg" align=center>
              <TD height="30" colSpan=2>
               <INPUT TYPE=submit VALUE=" ������ " CLASS="medium" NAME="signup_submit">
 &nbsp;&nbsp;<INPUT class=main type=button size=3 value=������ҳ name=Submit2 onClick="javascript:window.history.go(-1)">                       </TD>
            </TR>
          </TBODY>
        </TABLE>
</form>
<br>
</body>
</html>