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
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="Microsoft FrontPage 5.0" name=GENERATOR>
<LINK  href="../smallPic/newdef.css" rel=stylesheet>
<link href="../ticket/my_RL/RLimages/user.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
-->

.un {
	font-size: 13px;
	font-style: normal;
	line-height: 20px;
	color: #FFFFFF;
	text-decoration: none;
	font-weight: bold;
}
.unnamed1 {font-size: 13px;
	font-style: normal;
	line-height: 20px;
	color: #000000;
	text-decoration: none;
}
</style>
</HEAD>

<BODY bgColor=#ffffff leftMargin=0 topMargin=0 >
<!-- onload="getpop(7)" -->
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
<tr> 
    <td colspan="2"><!--#include file="top.asp"--></td>
  </tr>
  <tr> 
    <td width="120" valign="top"> 
      <!--#include file="../ticket/my_RL/left.asp"-->
    </td>
    <td valign="top"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr> 
          <td width="648" height=88 valign="top" bgcolor="#FFFFFF">
		 	<table width="100%"  border="0" cellspacing="1" cellpadding="0">
              <tr bgcolor="#E9F1F4"> 
                <td width="6%" align="center" bgcolor="#E9F1F4"><img src="RLimages/ZXL013.gif" width="8" height="7"></td>
                <td width="94%" class="unnamed1"></td>
              </tr>
            </table>
            <table width="648" border="0" cellspacing="3" cellpadding="5">
              <tr> 
                <td width="331"  valign="bottom" > 
                  <div class="pageHeading"><b>�ҵĶ�����Ϣ&nbsp;&nbsp;</b></div>
                </td>
                <td width="220" align="right"> </td>
              </tr>
            </table>

<%
dim action
action=trim(request("action"))
select case action
case "delok"
delok
case "xiangq"
xiangq()
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
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#66CC99">
      <tr> 
        <td height="23" bgcolor="#E8F4CB">&nbsp;&nbsp;<img src="images/ring01.gif" width="9" height="9"> 
          <font color="#336600">��Ԥ���ľƵ����</font> </td>
      </tr>
    </table>
    <br>
    <table width="75%" border="0">
 <form action="hotorders.asp?action=jddd" method="post">
   <tr>
      <td><div align="center">������ѯ��������
          <input name="dd" type="text" id="dd">
          <input type="submit" name="Submit3" value="��ѯ">
        </div></td>
    </tr>
  </form>
  </table>
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
      <td width="14%" height="25" align="center" background="images/bg_listTitle01.gif">������</td>
      <td width="12%" align="center" background="images/bg_listTitle01.gif"> ��ס����</td>
      <td width="12%" align="center" background="images/bg_listTitle01.gif"> �������</td>
      <td width="20%" align="center" background="images/bg_listTitle01.gif"> Ԥ���Ƶ�</td>
      <td width="17%" align="center" background="images/bg_listTitle01.gif"> Ԥ������</td>
      <td width="8%" align="center" background="images/bg_listTitle01.gif"> ״̬</td>
      <td width="17%" align="center" background="images/bg_listTitle01.gif">����</td>
    </tr>
    <%

  do while not rs.eof 
%>
    <tr> 
      <td height="23" align="center"><%=rs("dd")%></td>
      <td height="23" align="center"> <p align="center"><%=rs("jointime")%></td>
      <td width="12%" align="center" height="23"> <p align="center"><%=rs("leavetime")%></td>
      <td width="20%" align="center" height="23"> <p align="center"><%=rs("c_id")%></td>
      <td width="17%" align="center" height="23"> <p align="center"><%=year(rs("regtime"))%>-<%=month(rs("regtime"))%>-<%=day(rs("regtime"))%></td>
      <td width="8%"  height="23">
	  <%
	  if rs("flag")=1 then
	  response.write"���׳ɹ�"
	  else
	  response.write"�ȴ�����"
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

<%
sub xiangq()
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where id="&request("id")&"" 
rs.open sqltext,conn,1,1
%>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#66CC99">
    <tr> 
      <td height="23" bgcolor="#E8F4CB">&nbsp;&nbsp;<img src="images/ring01.gif" width="9" height="9"> 
        <font color="#336600">Ԥ���Ƶ����飺</font> </td>
    </tr>
  </table>
  <br>
  <table width="96%"  align="center" border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
    <TBODY>
            
      <tr> 
        <TD height=30 colspan="2" align="right" background="images/bg_listTitle01.gif"> 
          <p align="left">&nbsp;<img src="images/arrow3.gif" width="29" height="11">Ԥ������</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>�µ�ʱ��<span lang="en-us">�� 
          </span></span></TD>
              
        <TD width=426 height=25><%=rs("regtime")%></TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>����״̬��</span></TD>
              
        <TD width=426 height=25> 
          <%if rs("flag")=1 then%>
          <font color="#008000">�������,���׳ɹ�</font> 
          <%else%>
          <font color="#FF0000">δ���κδ���</font> 
          <%end if%>
        </TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>�������ƣ�</span></TD>
              
        <TD width=426 height=25><%=rs("c_id")%> 
        ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>��ס���ڣ�</span></TD>
              
        <TD  width=426 height=25 ><%=rs("jointime")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"><SPAN >������ڣ�</SPAN></TD>
              
        <TD width=426 height=25><%=rs("leavetime")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>���㷽ʽ��</span></TD>
              
        <TD width=426 height=25><%=rs("paytype")%> ��</TD>
      </tr>
            
      <tr> 
        <TD height=30 colspan="2" align="right" background="images/bg_listTitle01.gif"> 
          <p align="left">&nbsp;<img src="images/arrow3.gif" width="29" height="11">����ѡ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"><SPAN >���ͣ�</SPAN></TD>
              
        <TD width=426 height=25><%=rs("roomtype")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>Ԥ��������</span></TD>
              
        <TD width=426 height=25><%=rs("roomnum")%> &nbsp;�� ��<%=rs("price")%>Ԫ/ÿ�䣩</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>�ܽ�</span></TD>
              
        <TD width=426 height=25> RMB&nbsp;<%=rs("totalnum")%> Ԫ</TD>
      </tr>
            
      <tr> 
        <TD height=30 colspan="2" align="right" background="images/bg_listTitle01.gif"> 
          <p align="left">&nbsp;<img src="images/arrow3.gif" width="29" height="11">Ԥ������</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"><SPAN >��ס������</SPAN></TD>
              
        <TD width=426 height=25> &nbsp;<%=rs("number")%>��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"><SPAN >��ס����ݣ�</SPAN></TD>
              
        <TD width=426 height=25><%=rs("degree")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"><SPAN >��ס�Ǽ��ˣ�</SPAN></TD>
              
        <TD width=426 height=25><%=rs("man1")%>,<%=rs("man2")%>,<%=rs("man3")%>,<%=rs("man4")%>,<%=rs("man5")%>,<%=rs("man6")%>,<%=rs("man7")%>,<%=rs("man8")%> 
        </TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>����Ŀ�ĵط�ʽ��</span></TD>
              
        <TD width=426 height=25><%=rs("cometype")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>���絽��ʱ�䣺</span></TD>
              
        <TD width=426 height=25><%=rs("zs")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right"> <span>������ʱ�䣺</span></TD>
              
        <TD width=426 height=25><%=rs("ws")%> ��</TD>
      </tr>
            
      <tr> 
        <TD height=30 colspan="2" align="right" background="images/bg_listTitle01.gif"> 
          <p align="left">&nbsp;<img src="images/arrow3.gif" width="29" height="11">��ϵ��Ϣ</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right" > <span>��Ա�ʺţ�</span></TD>
              
        <TD width=426 height=25><%=rs("userid")%></TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right" > <span>��ϵ�ˣ�</span></TD>
              
        <TD width=426 height=25><%=rs("username")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right" > <span>�ֻ���绰��</span></TD>
              
        <TD width=426 height=25><%=rs("mobiletel")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right" > <span>���棺</span></TD>
              
        <TD width=426 height=25><%=rs("fax")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right" > <span>�����ʼ���</span></TD>
              
        <TD width=426 height=25><%=rs("email")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right" > <span>ȷ�Ϸ�ʽ��</span></TD>
              
        <TD width=426 height=25><%=rs("affirmtype")%> ��</TD>
      </tr>
            
      <tr bgcolor="#FFFFFF"> 
        <TD width=152 height=25 align="right" ><SPAN >����˵����</SPAN></TD>
              
        <TD width=426 height=25><%=rs("explain")%> ��</TD>
      </tr>
            
      <TR> 
    
    </TBODY>
  </TABLE>
   <%
end sub
%>


          </td>
        </tr>
      </table>
    </td>
  </tr>
  
  <tr> 
    <td colspan="2" align="center"><!--#include file="../ticket/my_RL/foot.asp"--></td>
  </tr>
</table>
</BODY>
</HTML>
