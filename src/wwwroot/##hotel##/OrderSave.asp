<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>酒店订房 - <%=ZXLCompanyStr%></title>
<link rel="stylesheet" href="images/style.css" type="text/css">
<link href="../Css/main_api.css" type="text/css" rel="stylesheet" />
</head>
<!--#include file="include/cfg.asp"-->
<!--#include file="../ticket/include/conn.asp"-->
<!--#include file="../ticket/include/function.asp"-->
<%
From_url = Cstr(Request.ServerVariables("HTTP_REFERER")) 
Serv_url = Cstr(Request.ServerVariables("SERVER_NAME")) 
if mid(From_url,8,len(Serv_url)) <> Serv_url then 
Server.Transfer "err.asp"
response.end 
end if 

if datediff("d",request("starttime"),request("deptime")) = 0 then
response.Write "<script language=javascript>alert('入住该酒店的日期不对，入住日期至少是1天！');</script>"
response.Write("<script language=javascript>history.go(-2);</script>")
response.end
end if
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where dd='"&request("dd")&"' "
rs.open sqltext,conn,3,3
if not rs.eof then
response.Write "<script language=javascript>alert('此订单已经提交过了！');window.close();</script>"
response.end
else

rs.addnew
rs("c_id")=request.form("hotelname")
rs("userid")=session("mem_name")
rs("idd")=request.form("hotelid")
rs("dd")=request("dd")
rs("zs")=request("EarlyArrivalTime")
rs("ws")=request("arrivalTime")
rs("roomtype")=request.form("roomtype")
rs("jointime")=request.form("starttime")
rs("leavetime")=request.form("deptime")
rs("paytype")=request.form("paytype")
rs("roomnum")=request.form("Roomcount")
rs("price")=request("price")
rs("totalnum")=request.Form("Roomcount") * request.Form("price")
rs("username")=request.form("contactname")
rs("mobiletel")=request.form("Phone")
if request.form("fax")="" then
	rs("fax")="无"
else
	rs("fax")=request.form("fax")
end if
rs("email")=request.form("email")
rs("affirmtype")=request.form("ConfirmType")
if request.form("info")="" then
	rs("explain")="无"
else
	rs("explain")=request.form("info")
end if
rs("number")=request.form("personcount")
rs("degree")=request.form("ClientComeFrom")
if request("clientname1")="" then
	rs("man1")="无"
else
	rs("man1")=request.form("clientname1")
end if
if request("clientname2")="" then
	rs("man2")="无"
else
	rs("man2")=request.form("clientname2")
end if
if request("clientname3")="" then
	rs("man3")="无"
else
	rs("man3")=request.form("clientname3")
end if
if request("clientname4")="" then
	rs("man4")="无"
else
	rs("man4")=request.form("clientname4")
end if
if request("clientname5")="" then
	rs("man5")="无"
else
	rs("man5")=request.form("clientname5")
end if
if request("clientname6")="" then
	rs("man6")="无"
else
	rs("man6")=request.form("clientname6")
end if
if request("clientname7")="" then
	rs("man7")="无"
else
	rs("man7")=request.form("clientname7")
end if
if request("clientname8")="" then
	rs("man8")="无"
else
	rs("man8")=request.form("clientname8")
end if
if request("ArrivalWay")="" then
	rs("cometype")="无"
else
	rs("cometype")=request.form("ArrivalWay")
end if
rs("zs")=request.form("EarlyArrivalTime")
rs("ws")=request.form("arrivalTime")
rs.update
rs.close

set rs=server.createobject("adodb.recordset")
sqltext="select * from jifen "
rs.open sqltext,conn,3,3
rs.addnew
rs("userid")=session("mem_name")
rs("jfz")=request.form("roomcount")*request("price")*datediff("d",request("starttime"),request("deptime"))
rs("bz")="预定酒店"
rs("dd")=request("dd")
rs("jd")=1

rs.update
rs.close
conn.close
end if
%>
<body text="555555" link="555555" vlink="555555" alink="555555" leftmargin="0" topmargin="0" marginwidth="0" arginheight="0">
<!--#include file="header.asp"-->
    <table width="980" border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td height="37" align="right"><img src="images/pic_schedule05.gif" width="200" height="26"></td>
      </tr>
    </table>
    <table id=zy width=980 align="center" border=0 cellPadding=0 cellSpacing=0 bordercolor=#BDDDF9 borderColorDark=#ffffff bgcolor=#FFFFFF>
      <TBODY>
        <tr  > 
          <TD width="980" height=30> 
          <table width="980" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#BDDDF9" style="border-collapse:collapse; margin-bottom:10px">
            <tr> 
              <td height="30"><img src="images/1.jpg" width="11" height="11">&nbsp;<font style="font-size:14px; color:#136CFF">订单完成：</font></td>
              </tr>
            <tr> 
              <td height="30" align="center" background="images/bg_listTitle01.gif" bgcolor="#FFFFFF"><font style="font-size:14px; color:#FF0000">订单已提交，我们将尽快确认您的预订！</font></td>
              </tr>
            </table>
		  </TD>
        </tr>
        <tr> 
          <TD height=30>  
          <table width="760" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#BDDDF9" bgcolor="#FFFFFF" style="border-collapse:collapse; margin-bottom:10px">
            <tr><td colspan="4" height="28"><img src="images/2.jpg" width="11" height="11">&nbsp;<font style="font-size:14px; color:#136CFF">预定信息：</font></td></tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="125" height="28" align="center" background="images/bg_listTitle01.gif">定单号</td>
                
              <td width="319" align="center" background="images/bg_listTitle01.gif">酒店资料</td>
                
              <td width="110" align="center" background="images/bg_listTitle01.gif">单间费用</td>
                
              <td width="172" align="center" background="images/bg_listTitle01.gif">备注</td>
            </tr>
              
            <tr bgcolor="#FFFFFF"> 
              <td height="5" align="center"><%=request("dd")%></td>
                
              <td height="5" align="center">&nbsp; <%=request("hotelname")%> 
                <table width="75%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="6"> </td>
                    </tr>
                  </table>
                  <%=request("roomtype")%> ;<%=request("Roomcount")%>间 ;<%=datediff("d",request("starttime"),request("deptime"))%> 天</td>
                
              <td height="5" align="center"><font color="#FF0000"><%=request("price")%>/间</font></td>
                
              <td height="5" align="center">前台现付；<br>
                  入住日期：<%=request("starttime")%></td>
              </tr>
              
            <tr bgcolor="#FFFFFF"> 
              <td height="5" colspan="4" align="right" style="padding-right:20px;">总费用：<font style="font-size:14px; color:#FF0000"><b><%=request.Form("Roomcount")%></B>间 * <%=request.Form("price")%>/间 = <%=request.Form("Roomcount") * request.Form("price")%></font></td>
              </tr>
            </table>
          </TD>
        </tr>
        <TR> 
          
        <TD style="line-height:200%; padding-left:20px;">
		注意事项：<br>
        ①：如果您所填写的电话、E-mail有误，此订单将被自动取消； <br>
        ②：如果因特殊原因（如酒店无房）造成订单处理困难，我们会及时和您联系； <br>
        ③：如果您的行程发生变化需要变更订单，您可以在网上进行，也可以及时通知我们。 </TD>
        </TR>
      </TBODY>
    </TABLE>
	<!--#include file="footer.asp"-->
</body>
</html>