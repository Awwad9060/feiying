<%
if session("mem_name") = "" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
%>
<!--#include file="include/conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="images/style.css" type="text/css">
<title>�Ƶ궩���鿴</title>
</head>
<%
dim uid ,upwd
uid=session("mem_name")
set rs=server.createobject("adodb.recordset")
sqltext="select * from [orderb] where userid='"&uid&"'"
rs.open sqltext,conn,1,1
%>
<body bgcolor="#ffffff" scroll="no" style="margin:0px">
<br>
<div align="center"> 
  <%
dim action
action=trim(request("action"))
select case action
case "delok"
delok
case "jddd"
jddd()
case "jpdd"
jpdd()
case "jddel"
jddel()
case else
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end select
sub myinfo()%>
  
    <%end sub
%>
    
  <%
sub jddd()
%>
<form action="user_main.asp?action=jddd" method="post">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#66CC99">
      <tr> 
        <td height="23" bgcolor="#E8F4CB">&nbsp;&nbsp;<img src="images/ring01.gif" width="9" height="9"> 
          <font color="#336600">��Ԥ���ľƵ����</font> </td>
      </tr>
    </table>
    <br>
    <table width="75%" border="0">
    <tr>
      <td><div align="center">������ѯ��������
          <input name="dd" type="text" id="dd">
          <input type="submit" name="Submit3" value="��ѯ">
        </div></td>
    </tr>
  </table>
  </form>
  <%
set rs=server.createobject("adodb.recordset")
if request("dd")<>"" then
	sqltext="select * from orderb where userid='"&session("mem_name")&"' and dd='"&request("dd")&"' order by id desc" 
		else
	sqltext="select * from orderb where userid='"&session("mem_name")&"' order by id desc" 
end if
'response.write sqltext
rs.open sqltext,conn,1,1
If rs.eof and rs.bof then 
   response.write"<font style=""font-size:12px;"">û����Ҫ��ѯ����Ϣ</font>"
Else
%>
 
  <table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
    <tr class=main2> 
      <td width="14%" height="25" align="center" background="images/bg_listTitle01.gif">�����ţ�</td>
      <td width="16%" align="center" background="images/bg_listTitle01.gif"> ��ס���ڣ�</td>
      <td width="14%" align="center" background="images/bg_listTitle01.gif"> ������ڣ�</td>
      <td width="12%" align="center" background="images/bg_listTitle01.gif"> Ԥ���Ƶ꣺</td>
      <td width="17%" align="center" background="images/bg_listTitle01.gif"> Ԥ�����ڣ�</td>
      <td width="10%" align="center" background="images/bg_listTitle01.gif"> ״̬��</td>
      <td width="17%" align="center" background="images/bg_listTitle01.gif">����</td>
    </tr>
    <%

  do while not rs.eof 
%>
    <tr> 
      <td height="23" align="center"><%=rs("dd")%></td>
      <td height="23" align="center"> <p align="center"><%=rs("jointime")%></td>
      <td width="14%" align="center" height="23"> <p align="center"><%=rs("leavetime")%></td>
      <td width="12%" align="center" height="23"> <p align="center"><%=rs("c_id")%></td>
      <td width="17%" align="center" height="23"> <p align="center"><%=year(rs("regtime"))%>-<%=month(rs("regtime"))%>-<%=day(rs("regtime"))%></td>
      <td width="10%"  height="23">
	  <%
	  if rs("flag")=1 then
	  response.write"���׳ɹ�"
	  else
	  response.write"������ȷ�ϣ��ȴ����ף�"
	  end if
	  %>
	  </td>
      <td width="17%" align="center" height="23"> <input name="button" type="button" onClick=" window.location='?id=<%=rs("id")%>&action=xiangq'"value="����"> 
       <%if rs("flag")=0 then%> <input name="button" type="button" onClick="if (confirm('ȷʵҪ�����˴ζ�����')) window.location='?id=<%=rs("id")%>&action=jddel'" value="����"><%end if%></td>
    </tr>
<%
rs.movenext
loop
End If
rs.close
%>
  </table>
   
  <%
end sub

sub jddel()
   dim SQL, Rs, contentID,CurrentPage
   contentID=request("ID")

   set rs=server.createobject("adodb.recordset")
   sqltext="delete * from orderb where id="& contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
   response.redirect "user_main.asp?action=jddd"
end sub
%>
</div>
</body>
</html>