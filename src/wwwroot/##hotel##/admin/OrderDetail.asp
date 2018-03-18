<!--#include file="../../ticket/include/conn.asp"-->
<!--#include file="../../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"HT") then
		response.Write("<script lanaguage=javascript>alert('提示：\n\n对不起，您没有管理此栏目的权限\n\n请联系管理员！');history.back(-1);</script>")
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
<title>宾馆预定</title>
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
				<td  colspan="2" height="30" valign="middle" style="font-size:14px; font-weight:bold; color:#3300FF">　订单详情查阅</td>
			</tr>
            <tr>
              <TD height=25 colspan="2" class="topbg">&nbsp;订单资料</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>下单时间<span lang="en-us">： </span></span></TD>
              <TD width=771 height=25><%=rs("regtime")%></TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>订单状态：</span></TD>
              <TD width=771 height=25><%if rs("flag")=1 then%>
                  <font color="#008000">处理完毕</font>
                  <%else%>
                  <font color="#FF0000">未做任何处理</font>
              <%end if%></TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>宾馆名称：</span></TD>
              <TD width=771 height=25><%=rs("c_id")%></TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>入住日期：</span></TD>
              <TD  width=771 height=25 ><%=rs("jointime")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >离店日期：</SPAN></TD>
              <TD width=771 height=25><%=rs("leavetime")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>结算方式：</span></TD>
              <TD width=771 height=25><%=rs("paytype")%> 　</TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                <p align="left">&nbsp;房间选择</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >房型：</SPAN></TD>
              <TD width=771 height=25><%=rs("roomtype")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>预定间数：</span></TD>
              <TD width=771 height=25><%=rs("roomnum")%> &nbsp;间 （<%=rs("price")%>元/每间）</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>总金额：</span></TD>
              <TD width=771 height=25> &nbsp;<%=rs("totalnum")%> </TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                <p align="left">&nbsp;预定条款</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >入住人数：</SPAN></TD>
              <TD width=771 height=25> &nbsp;<%=rs("number")%>人</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >入住人身份：</SPAN></TD>
              <TD width=771 height=25><%=rs("degree")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"><SPAN >入住登记人：</SPAN></TD>
              <TD width=771 height=25><%=rs("man1")%>,<%=rs("man2")%>,<%=rs("man3")%>,<%=rs("man4")%>,<%=rs("man5")%>,<%=rs("man6")%>,<%=rs("man7")%>,<%=rs("man8")%> </TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>到达目的地方式：</span></TD>
              <TD width=771 height=25><%=rs("cometype")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>最早到店时间：</span></TD>
              <TD width=771 height=25><%=rs("zs")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 bgColor=#EBEBEB height=25 align="right"> <span>最晚到店时间：</span></TD>
              <TD width=771 height=25><%=rs("ws")%> 　</TD>
            </tr>
            <tr>
              <TD height=30 colspan="2" align="right" background="Images/topBar_bg.gif">
                <p align="left">&nbsp;联系信息</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>会员帐号：</span></TD>
              <TD width=771 height=25><%=rs("userid")%></TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>联系人：</span></TD>
              <TD width=771 height=25><%=rs("username")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>手机或电话：</span></TD>
              <TD width=771 height=25><%=rs("mobiletel")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>传真：</span></TD>
              <TD width=771 height=25><%=rs("fax")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>电子邮件：</span></TD>
              <TD width=771 height=25><%=rs("email")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB > <span>确认方式：</span></TD>
              <TD width=771 height=25><%=rs("affirmtype")%> 　</TD>
            </tr>
            <tr>
              <TD width=172 height=25 align="right" bgColor=#EBEBEB ><SPAN >特殊说明：</SPAN></TD>
              <TD width=771 height=25><%=rs("explain")%> 　</TD>
            </tr>
            <TR class="topbg" align=center>
              <TD height="30" colSpan=2>
               <INPUT TYPE=submit VALUE=" 处理订单 " CLASS="medium" NAME="signup_submit">
 &nbsp;&nbsp;<INPUT class=main type=button size=3 value=返回上页 name=Submit2 onClick="javascript:window.history.go(-1)">                       </TD>
            </TR>
          </TBODY>
        </TABLE>
</form>
<br>
</body>
</html>